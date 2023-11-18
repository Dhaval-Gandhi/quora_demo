class Question < ApplicationRecord

  belongs_to :topic
  belongs_to :user
  has_many :answers
  
  validates :content, presence: true

end
