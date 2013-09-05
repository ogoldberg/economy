class Transaction < ActiveRecord::Base
  include ActiveModel::Serialization
  belongs_to :giver, class_name: "User"
  belongs_to :recipient, class_name: "User"

  serialize :points
end
