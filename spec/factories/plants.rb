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
#  index_plants_on_name  (name) UNIQUE
#

FactoryBot.define do
  factory :plant do
    sequence(:name) { |n| "Plant Name #{n}" }
    sequence(:code) { |n| "Plant Code #{n}" }
  end
end
