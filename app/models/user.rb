class User < ActiveRecord::Base
  has_secure_password
  has_many :roles
  has_many :squads, through: :roles
end
