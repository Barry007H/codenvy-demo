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

  describe 'associations' do
    it { is_expected.to respond_to :messages }
    it { is_expected.to respond_to :users }

    describe 'messages' do
      subject { room.messages }
      context 'when none' do
        before { room.messages.destroy_all }

        it { is_expected.to eq [] }
      end

      context 'when 5 messages' do
        before { create_list :message, 5, room: room }

        it 'has five items' do
          expect(subject.size).to eq 5
        end
        it { is_expected.to all(be_an_instance_of(Message)) }
      end
    end

    describe 'users' do
      subject { room.users }

      context 'with no messages' do
        before { room.messages.destroy_all }

        it { is_expected.to eq [] }
      end

      context 'with 10 messages from 2 users' do
        before do
          2.times do
            user = create :user
            create_list :message, 5, room: room, user: user
          end
        end

        it 'returns 10 items' do
          expect(subject.size).to eq 10
        end

        it 'returns 2 unique items' do
          expect(subject.uniq.size).to eq 2
        end

        it { is_expected.to all(be_an_instance_of(User)) }
      end
    end
  end

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
