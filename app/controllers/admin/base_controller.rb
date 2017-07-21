class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  protected 
  def authenticate_admin!
    render_404 unless current_user.try(:admin?) && current_user
  end
end