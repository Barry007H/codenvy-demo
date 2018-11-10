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

class Room < ApplicationRecord
  validates :description, presence: true
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
