# frozen_string_literal: true

# == Schema Information
#
# Table name: plants
#
#  id          :integer          not null, primary key
#  code        :string           not null
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_plants_on_code  (code) UNIQUE
#

FactoryBot.define do
  factory :plant do
    name { 'Plant Name' }
    sequence(:code) { |n| "Plant Code #{n}" }
    description { 'Plant Description.' }
  end
end
