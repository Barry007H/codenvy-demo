# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

FactoryBot.define do
  factory :user do
    first_name { 'User First Name' }
    last_name { 'User Last Name' }
    sequence(:email) { |n| "user#{n}@example.com" }

    trait :with_messages do
      transient do
        message_count { 5 }
      end

      after :create do |user, evaluator|
        create_list :message, evaluator.message_count, user: user
      end
    end

    factory :user_with_messages, traits: %i[with_messages]
  end
end
