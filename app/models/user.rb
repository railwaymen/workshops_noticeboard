class User < ActiveRecord::Base
  devise :omniauthable
  attr_accessible :email, :name, :uid
  validates :uid, :email, :name, presence: true
  has_many :posts
end
