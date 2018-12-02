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

# Representation of a manufacturing plant.
class Plant < ApplicationRecord
  validates :code, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
