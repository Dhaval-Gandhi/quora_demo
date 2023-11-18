class UserFollow < ApplicationRecord

  belongs_to :user
  belongs_to :following, class_name: 'User', foreign_key: 'following_id'

  validates :user_id, uniqueness: {scope: :following_id, message: 'already following.'}

end
