module BusinessesHelper
  def business_address(user)
    "#{user.address}, #{user.city}, #{user.state}."
  end
end
