class Admin::BusinessesController < Admin::BaseController
  before_action :set_business, only: [:update, :destroy]

  def business_request
    @unactivated_businesses = Business.where(activated: false).page(params[:page]).per(30)
  end

  def update
    # TODO toggle the activated status for businesses 
    @business.toggle(:activated)
    if @business.save
      flash[:success] = "Successfully activated #{@business.business_name}'s business."
      # TODO send mail to business to notify it has been added
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