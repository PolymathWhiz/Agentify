class Admin::HomeController < Admin::BaseController
  
  def index
    @activated_businesses = Business.where(activated: true).count
    @unactivated_businesses = Business.where(activated: false).count
    # @total_businesses = Business.all.count
    @total_admins = Admin.where(admin: true).count 
    @total_admin_requests = Admin.all.count
  end
  
end