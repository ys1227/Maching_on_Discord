class Question < ApplicationRecord
  has_many :category

  validates :title, presence: true
  validates :content, presence: true
end
