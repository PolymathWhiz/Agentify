class Admin::HomeController < Admin::BaseController
  
  def index
    @activated_businesses = Business.where(activated: true).count
    @unactivated_businesses = Business.where(activated: false).count
    @travel_agents = Business.where("Agency_type = ? AND activated = ?", "Travel Agent", true).count
    @estate_agents = Business.where("Agency_type = ? AND activated = ?", "Real Estate Agent", true).count
    @hostel_agents = Business.where("Agency_type = ? AND activated = ?", "Hostel Agent", true).count
    @car_agents = Business.where("Agency_type = ? AND activated = ?", "Car Agent", true).count
    @total_admins = Admin.where(admin: true).count 
    @total_admin_requests = Admin.where(admin: false).count
  end
  
end