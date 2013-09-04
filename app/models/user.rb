class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rewards
  has_many :points, through: :rewards

  after_create do
    100.times do
      r = Reward.new({recipient: self, giver: User.find_by_email("welcome@morekarma.com"), point: Point.new})
      r.save!
    end
  end
end
