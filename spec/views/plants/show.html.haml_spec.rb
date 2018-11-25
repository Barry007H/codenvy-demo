# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plants/show', type: :view do
  before(:each) do
    @plant = assign(:plant, Plant.create!(
                              name: 'Name',
                              code: 'Code',
                              description: 'MyText'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/MyText/)
  end
end
