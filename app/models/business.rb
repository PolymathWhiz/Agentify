class Business < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :business_name, :state, :city, :address,
                         :requester_name, :requester_email, :agency_type

  default_scope -> { order(business_name: :asc) }

  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  # TODO Validate the various formats of inputs
  validates :business_name, uniqueness: {case_sensitive: false}
  validates :business_website,    format: URI::regexp(%w(http https))
  validates :requester_email, format: { with: EMAIL_REGEX}

  searchkick word_middle: [:search_data]

  extend FriendlyId
  friendly_id :business_name, use: :slugged


  # mount_uploader :avatar, AvatarUploader # Carrierwave

  # # User Avatar Validation
  # validates_integrity_of  :avatar
  # validates_processing_of :avatar

  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using
    #our own "is_active" column
    super and self.activated?
  end

  def full_address
    "#{address}, #{city}, #{state}."
  end

  def should_generate_new_friendly_id?
    slug.blank? || business_name_changed?
  end

  private 

  # Search params used
  # by searchkick gem
  def search_data
    {
      business_name: business_name,
      city: city,
      state: state,
      agency_type: agency_type
    }
  end
  
  # def avatar_size_validation
  #   errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  # end
end
