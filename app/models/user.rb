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

# Abstraction of an application user.
class User < ApplicationRecord
  validates :email,               presence: true,
                                  uniqueness: { case_sensitive: false }
  validates :username,            presence: true,
                                  uniqueness: { case_sensitive: false }
  validates :encrypted_password,  presence: true
  validates :salt,                presence: true

  has_many :messages
  has_many :rooms, through: :messages
end
