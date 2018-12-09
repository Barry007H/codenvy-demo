# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { build :message }

  describe 'instance attributes' do
    subject { message }

    describe 'body' do
      context 'when nil' do
        before { subject.body = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty String' do
        before { subject.body = '' }

        it { is_expected.to be_invalid }
      end
    end

    describe 'room_id' do
      context 'when nil' do
        before { subject.room_id = nil }

        it { is_expected.to be_invalid }
      end
    end

    describe 'user_id' do
      context 'when nil' do
        before { subject.user_id = nil }

        it { is_expected.to be_invalid }
      end
    end
  end
end
