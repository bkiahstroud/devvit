# frozen_string_literal: true

class Subdevvit < ApplicationRecord
  has_many :posts

  validates :name, presence: true
end
