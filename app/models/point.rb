class Point < ActiveRecord::Base
  has_and_belongs_to_many :transactions
  has_many :users, through: :transactions
end
