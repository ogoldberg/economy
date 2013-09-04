class Reward < ActiveRecord::Base
  belongs_to :giver, :class_name => "User"
  belongs_to :recipient, :class_name => "User"
  belongs_to :point
end
