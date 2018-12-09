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

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  describe 'associations' do
    subject { user }

    it { is_expected.to respond_to :messages }
    it { is_expected.to respond_to :rooms }

    describe 'messages' do
      subject { user.messages }

      context 'when none' do
        before { user.messages.destroy_all }

        it { is_expected.to eq [] }
      end

      context 'when has 5 messages' do
        before { create_list :message, 5, user: user }

        it { is_expected.to all(be_an_instance_of(Message)) }
      end
    end
  end

  describe 'instance attributes' do
    describe 'email' do
      subject { user }

      context 'when nil' do
        before { subject.email = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty String' do
        before { subject.email = '' }

        it { is_expected.to be_invalid }
      end

      context 'when already in use' do
        context 'and the same case' do
          before { create :user, email: subject.email }

          it { is_expected.to be_invalid }
        end

        context 'and a different case' do
          before { create :user, email: subject.email.swapcase }

          it { is_expected.to be_invalid }
        end
      end
    end

    describe 'username' do
      subject { user }

      context 'when nil' do
        before { subject.username = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty String' do
        before { subject.username = '' }

        it { is_expected.to be_invalid }
      end

      context 'when already in use' do
        context 'and the same case' do
          before { create :user, username: subject.username }

          it { is_expected.to be_invalid }
        end

        context 'and a different case' do
          before { create :user, username: subject.username.swapcase }

          it { is_expected.to be_invalid }
        end
      end
    end

    describe 'encrypted_password' do
      subject { user }

      context 'when nil' do
        before { subject.encrypted_password = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty String' do
        before { subject.encrypted_password = '' }

        it { is_expected.to be_invalid }
      end
    end

    describe 'salt' do
      subject { user }

      context 'when nil' do
        before { subject.salt = nil }

        it { is_expected.to be_invalid }
      end

      context 'when an empty String' do
        before { subject.salt = '' }

        it { is_expected.to be_invalid }
      end
    end
  end
end
