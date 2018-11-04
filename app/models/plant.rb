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

class Plant < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :code, presence: true,
                   uniqueness: { case_sensitive: false }
end
