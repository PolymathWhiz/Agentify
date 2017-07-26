class Admin::AccessController < Admin::BaseController
  before_action :set_admin, only: [:revoke_access, :grant_access, :destroy]

  def index
    @admins = Admin.where.not(admin: false, id: current_admin.id).page(params[:page]).per(30)
    @count = Admin.where(admin: true).count
  end

  def admin_requests
    @requests = Admin.where(admin: false).page(params[:page]).per(30)
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