class Admin::BusinessesController < Admin::BaseController

  def business_request
  end

  def update
    @business = Business.find(params[:id])
    # TODO toggle the activated status for businesses 
    @business.toggle(:activated)
    if @business.save
      flash[:success] = "Successfully activated #{@business.business_name}'s business."
      # TODO send mail to business to notify it has been added
    else
      flash[:danger] = "Unable to activate #{@business.business_name}'s business."
    end
  end

  def destroy
    @business = Business.find(params[:id])
    if @business.destroy
      flash[:success] = "Successfully deleted business"
      redirect_to admin_users_path
    else 
      flash[:warning] = "Problem encountered while deleting the current business."
    end
  end

  private
    def business_params
      params.require(:business).permit()
    end

end