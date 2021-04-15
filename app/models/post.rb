# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :subdevvit

  validates :title, presence: true
  validates :subdevvit, presence: true
end
