class Admin::AccessController < Admin::BaseController
  before_action :set_admin, only: [:destroy]

  def index
    @admins = Admin.where.not(id: current_admin.id).page(params[:page]).per(30)
    @count = Admin.where(admin: true).count
  end

  def admin_requests
    @requests = Admin.where(admin: false).page(params[:page]).per(30)
  end

  def destroy
    if @admin.destroy
      flash[:success] = "Successfully deleted business"
      redirect_to admin_requests_path
    else 
      flash[:warning] = "Problem encountered while deleting the current business."
    end
  end

  private

    def set_admin
      @admin = Admin.friendly.find(params[:id])
    end
  
end