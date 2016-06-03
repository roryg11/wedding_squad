class Role < ActiveRecord::Base
  belongs_to :squad
  belongs_to :user
end
