class BusinessesController < ApplicationController
  before_action :set_business, only: :show

  def show
  end

  private
  
  def set_business
    @business = Business.find(params[:id])
  end
  
  def business_params
  end
end
