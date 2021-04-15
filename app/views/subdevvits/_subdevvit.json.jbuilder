# frozen_string_literal: true

json.extract! subdevvit, :id, :name, :description, :created_at, :updated_at
json.url subdevvit_url(subdevvit, format: :json)
