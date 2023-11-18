class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers

  has_many :user_follows
  has_many :followings, through: :user_follows

  has_many :topic_follows
  has_many :topics, through: :topic_follows

end
