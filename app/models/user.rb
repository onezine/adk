class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable
  validates_format_of :email,:with => Devise.email_regexp
  validates_uniqueness_of :email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :clear_password
  # attr_accessible :title, :body
  before_validation :generate_password, :on => :create
  before_save :encrypt_password

  def generate_password
    generated_password = Devise.friendly_token.first(8)    
    self.clear_password  = self.password = self.password_confirmation = generated_password if self.password.blank?
  end
  
  def encrypt_password
    unless password.blank?
      self.clear_password = password
    else
      user = User.find_by_id(id)
      self.clear_password = user.clear_password
    end
  end
end
