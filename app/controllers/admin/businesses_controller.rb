class Admin::BusinessesController < Admin::BaseController
  before_action :set_business, only: [:update, :destroy]

  def business_request
    @unactivated_businesses = Business.where(activated: false).page(params[:page]).per(30)
    @count = @unactivated_businesses.count
  end

  def activated_business
    @activated_businesses = Business.where(activated: true).page(params[:page]).per(30)
    @count = @activated_businesses.count
  end

  def update
    @business.toggle(:activated)
    if @business.save
      flash[:success] = "Successfully activated #{@business.business_name}'s business."
      AdminMailer.welcome_email(@business).deliver_later
      redirect_to admin_requests_path
    else
      flash[:danger] = "Unable to activate #{@business.business_name}'s business."
    end
  end

  def destroy
    if @business.destroy
      flash[:success] = "Successfully deleted business"
      redirect_to admin_requests_path
    else 
      flash[:warning] = "Problem encountered while deleting the current business."
    end
  end

  private
    def business_params
      params.require(:business).permit()
    end

    def set_business
      @business = Business.friendly.find(params[:id])
    end

end