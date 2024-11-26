class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ENUMs
  enum role: { 
    user: 0, 
    admin: 1 
  }, _prefix: true

  # Methods
  def is_logged_in_as_admin?
    return false if current_user.nil?
    self.role_admin?
  end
end
