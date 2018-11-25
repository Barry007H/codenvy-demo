# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plants/index', type: :view do
  before(:each) do
    assign(:plants, create_list(:plant, 2))
  end

  it 'renders a list of plants' do
    render
    assert_select 'tr>td', text: 'Plant Name', count: 2
    assert_select 'tr>td', text: /Plant Code \d+/, count: 2
    assert_select 'tr>td', text: 'Plant Description.', count: 2
  end
end
