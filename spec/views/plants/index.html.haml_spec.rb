# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plants/index', type: :view do
  before(:each) { assign(:plants, create_list(:plant, 2, description: 'Plant Description')) }

  it 'renders a list of plants' do
    render
    assert_select 'tr>td', text: /Plant Name/, count: 2
    assert_select 'tr>td', text: /Plant Code/, count: 2
    assert_select 'tr>td', text: 'Plant Description'.to_s, count: 2
  end
end
