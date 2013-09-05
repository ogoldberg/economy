class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_transactions, class_name: "Transaction", foreign_key: "giver_id"
  has_many :received_transactions, class_name: "Transaction", foreign_key: "recipient_id"

  after_create do
    point_initializer
  end

  def point_initializer    
    transaction = Transaction.new({recipient: self, giver: User.find_by_email("welcome@morekarma.com"), points: []})
    100.times do
      point = Point.new
      point.save
      transaction.points << point
    end
    transaction.save!
  end
end
