class TopicFollow < ApplicationRecord

  belongs_to :topic
  belongs_to :user

  validates :topic, uniqueness: {scope: :user, message: 'already following.'}

end
