# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rooms/index', type: :view do
  before(:each) { assign(:rooms, FactoryBot.create_list(:room, 2)) }

  it 'renders a list of rooms' do
    render
    assert_select 'tr>td', text: /Room Name \d+/, count: 2
    assert_select 'tr>td', text: 'Room description.'.to_s, count: 2
  end
end
