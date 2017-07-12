class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :business_name, :phno, :state, :city, :address, :business_website,
  											 :requester_name, :requester_email, :agency_type

  # TODO Validate the various formats of inputs
end
