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

require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { build :room }
  subject { room }

  describe 'instance attributes' do
    describe 'name' do
      context 'when nil' do
        before { subject.name = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty string' do
        before { subject.name = '' }

        it { is_expected.to be_invalid }
      end

      context 'when not unique' do
        context 'and same case' do
          before { create :room, name: subject.name }

          it { is_expected.to be_invalid }
        end

        context 'and different case' do
          before { create :room, name: subject.name.swapcase }

          it { is_expected.to be_invalid }
        end
      end
    end

    describe 'description' do
      context 'when nil' do
        before { subject.description = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty string' do
        before { subject.description = '' }

        it { is_expected.to be_invalid }
      end
    end
  end
end
