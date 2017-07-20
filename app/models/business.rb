class Business < ApplicationRecord
  EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :business_name, :phno, :state, :city, :address,
                         :requester_name, :requester_email, :agency_type

  # TODO Validate the various formats of inputs
  validates :business_website,    format: URI::regexp(%w(http https)), allow_blank: true
  validates :requester_email, format: { with: EMAIL_REGEX}


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

  # private
  
  # def avatar_size_validation
  #   errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  # end
end
