class User < ActiveRecord::Base
  has_secure_password
  has_many :roles
  has_many :squads, through: :roles
  has_many :invites, :class_name => 'Invite', :foreign_key => 'recipient_id'
  has_many :invites, :class_name => 'Invite', :foreign_key => 'sender_id'
end
