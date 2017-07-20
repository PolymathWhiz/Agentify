class BusinessesController < ApplicationController
  before_action :set_business, only: :show
  before_action :check_status, only: :show

  def show
  end

  private
  
  def set_business
    @business = Business.friendly.find(params[:id])
  end

  def check_status
    @business ||= Business.friendly.find(params[:id])
    render_404 unless @business.activated?
  end
end
