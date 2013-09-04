class Point < ActiveRecord::Base
  has_many :rewards
  has_many :users, through: :rewards
end
