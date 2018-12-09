# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           not null
#  encrypted_password :string           not null
#  salt               :string           not null
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "username#{n}" }
    encrypted_password { 'userpassword' }
    salt { 'usersalt' }

    trait :with_messages do
      transient do
        message_count { 5 }
      end

      after :create do |user, evaluator|
        create_list :messages, evaluator.message_count, user: user
      end
    end

    factory :user_with_messages, traits: %i[with_messages]
  end
end
