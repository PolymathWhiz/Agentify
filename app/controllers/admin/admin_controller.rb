class Admin::AdminController < Admin::BaseController
  before_action :set_admin, only: [:revoke_access, :grant_access, :destroy]

  def index
    @admins = Admin.where(admin: true)
  end

  def admin_requests
    @requests = Admin.where(admin: false)
  end
  
  def revoke_access
    if @admin.admin?
      @admin.toggle(:admin)
      @admin.save
      if @admin.save
        flash[:success] = "Admin access has been revoked"
      end
    else
      flash[:success] = "User admin status is not activated."
    end
  end

  def grant_access
    if !@admin.admin?
      @admin.toggle(:admin)
      @admin.save
      if @admin.save
        flash[:success] = "Admin access has been revoked"
      end
    else
      flash[:success] = "User admin status is not activated."
    end
  end

  private

    def set_admin
      @admin = Admin.friendly.find(params[:id])
    end
  
end