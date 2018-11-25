# frozen_string_literal: true

json.extract! plant, :id, :name, :code, :description, :created_at, :updated_at
json.url plant_url(plant, format: :json)
