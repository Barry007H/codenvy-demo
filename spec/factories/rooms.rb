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

    trait :with_messages do
      transient do
        message_count { 3 }
      end

      after :create do |room, evaluator|
        create_list :message, evaluator.message_count, room: room
      end
    end

    factory :room_with_messages, traits: %i[with_messages]
  end
end
