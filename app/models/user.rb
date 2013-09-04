class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions
  has_many :rewards, through: :transactions
  has_many :points, through: :rewards
  has_many :receivers, through: :rewards
  has_many :givers, through: :rewards

  after_create do
    t = Transaction.new
    t.save!
    100.times do
      r = Reward.new({receiver: self, giver: User.find_by_email("welcome@morekarma.com"), point: Point.new, transaction_id: t.id})
      r.save!
    end
  end
end
