class Business < ApplicationRecord
  before_save :normalize_fields
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :business_name, :state, :city, :address,
                         :requester_name, :requester_email, :agency_type

  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  # TODO Validate the various formats of inputs
  validates :business_name, uniqueness: {case_sensitive: false}
  validates :business_website,    format: URI::regexp(%w(http https)), allow_blank: true
  validates :requester_email, format: { with: EMAIL_REGEX}

  searchkick word_start: [:business_name, :city, :state]

  # Search params used
  # by searchkick gem
  def search_data
    {
      business_name: business_name,
      city: city,
      state: state,
      agency_type: agency_type,
      activated: activated 
    }
  end

  extend FriendlyId
  friendly_id :business_name, use: :slugged

  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using
    #our own "is_active" column
    super and self.activated?
  end

  def full_address
    "#{address}, #{city}, #{state}."
  end

  private 

  def normalize_fields
    self.requester_email = requester_email.downcase unless requester_email.blank?
    self.requester_name = requester_name.titleize unless requester_name.blank?
    self.business_name = business_name.titleize unless business_name.blank?
    self.business_website = business_website.downcase unless business_website.blank?
    address.capitalize! unless address.blank?
  end

  def should_generate_new_friendly_id?
    slug.blank? || business_name_changed?
  end

end
