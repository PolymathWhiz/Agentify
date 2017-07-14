class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

 	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_name, :agency_type, :phno, :address,                                                                :city, :state, :business_website, :requester_name,                                                           :requester_email, :about])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_name, :agency_type, :phno, :address, :city,
    																										:state, :business_website, :requester_name, :requester_email])
  end

  def render_404
    respond_to do |format|
      format.html do
        render file: Rails.root.join("public", "404"), layout: false, status: "404"
      end
      format.any { head :not_found }
    end
  end

end
