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

require 'rails_helper'

RSpec.describe Plant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
