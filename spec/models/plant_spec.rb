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

require 'rails_helper'

RSpec.describe Plant, type: :model do
  let(:plant) { build :plant }
  subject { plant }
  
  describe 'instance attributes' do
    it { is_expected.to respond_to :code }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :name }
    
    describe 'code' do
      context 'when an empty string' do
        before { subject.code = '' }
        
        it { is_expected.to be_invalid }
      end

      context 'when nil' do
        before { subject.code = nil }
        
        it { is_expected.to be_invalid }
      end
      
      context 'when already in use' do
        context 'and the same case' do
          before { create :plant, code: subject.code }
          
          it { is_expected.to be_invalid }
        end
        
        context 'and different case' do
          before { create :plant, code: subject.code.swapcase }
          
          it { is_expected.to be_invalid }
        end
      end
    end
  end
end
