class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_authentication_token!
  has_many :orders
  has_one :address
  # validates :auth_token, uniqueness: true



   def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
   end
end
