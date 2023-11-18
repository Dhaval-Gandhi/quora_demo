class Topic < ApplicationRecord

  has_many :questions

  validates :name, presence: true

end
