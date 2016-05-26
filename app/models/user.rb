class User < ActiveRecord::Base
  has_secure_password
  has_many :roles
  has_many :squads, through: :roles
  has_many :invites, :class_name => 'Invite', :foreign_key => 'recipient_id'
  has_many :invites, :class_name => 'Invite', :foreign_key => 'sender_id'

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
