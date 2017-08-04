class AdminMailer < ApplicationMailer
  default from: '"Agentify" <support@agentify.org>'
 
  def welcome_email(business)
    @business = business
    @url  = 'https://www.agentify.org/businesses/sign_in'
    mail(to: @business.email, subject: 'Request Status')
  end
end
