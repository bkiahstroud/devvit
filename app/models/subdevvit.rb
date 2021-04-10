class Subdevvit < ApplicationRecord
  has_many :posts

  validates :name, presence: true
end
