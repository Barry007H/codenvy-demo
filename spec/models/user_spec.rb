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

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  subject { user }

  describe 'instance attributes' do
    describe 'email' do
      context 'when nil' do
        before { subject.email = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty string' do
        before { subject.email = '' }

        it { is_expected.to be_invalid }
      end

      context 'when already in use' do
        context 'and same case' do
          before { create :user, email: subject.email }

          it { is_expected.to be_invalid }
        end

        context 'and different case' do
          before { create :user, email: subject.email.swapcase }

          it { is_expected.to be_invalid }
        end
      end
    end

    describe 'first_name' do
      context 'when nil' do
        before { subject.first_name = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty string' do
        before { subject.first_name = '' }

        it { is_expected.to be_invalid }
      end
    end

    describe 'last_name' do
      context 'when nil' do
        before { subject.last_name = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty string' do
        before { subject.last_name = '' }

        it { is_expected.to be_invalid }
      end
    end
  end
end
