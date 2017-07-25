class Admin::HomeController < Admin::BaseController
  
  def index
    @activated_businesses = Business.where(activated: true).count
    @unactivated_businesses = Business.where(activated: false).count
    @travel_agents = Business.where("Agency_type = ?", "Travel Agent").count
    @estate_agents = Business.where("Agency_type = ?", "Real Estate Agent").count
    @hostel_agents = Business.where("Agency_type = ?", "Hostel Agent").count
    @total_admins = Admin.where(admin: true).count 
    @total_admin_requests = Admin.where(admin: false).count
  end
  
end