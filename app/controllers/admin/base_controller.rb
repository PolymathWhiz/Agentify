class Admin::BaseController < ApplicationController
  # before_action :authenticate_admin!
  before_action :check_admin!

  def check_admin!
    render_404 unless current_admin
    # render_404 unless current_admin.try(:admin?) && current_admin
  end
end