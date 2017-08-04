class Admin::AdminController < Admin::BaseController
  before_action :set_admin, only: [:destroy]

  def index
    @admins = Admin.where.not(id: current_admin.id).page(params[:page]).per(30)
    @count = Admin.all.count
  end

  def admin_requests
    @requests = Admin.where(admin: false).page(params[:page]).per(30)
  end

  def destroy
    if @admin.destroy
      flash[:success] = "Successfully deleted admin."
      redirect_to admin_home_path
    else 
      flash[:warning] = "Problem encountered while deleting the current admin."
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end
  
end