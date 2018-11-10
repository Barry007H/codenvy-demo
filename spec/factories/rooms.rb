# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_rooms_on_name  (name) UNIQUE
#

FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "Room Name #{n}" }
    description { 'Room description.' }
  end
end
