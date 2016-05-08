class Role < ActiveRecord::Base
  belongs_to :squads
  belongs_to :users
end
