# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plants/new', type: :view do
  before(:each) do
    assign(:plant, Plant.new(
                     name: 'MyString',
                     code: 'MyString',
                     description: 'MyText'
                   ))
  end

  it 'renders new plant form' do
    render

    assert_select 'form[action=?][method=?]', plants_path, 'post' do
      assert_select 'input#plant_name[name=?]', 'plant[name]'

      assert_select 'input#plant_code[name=?]', 'plant[code]'

      assert_select 'textarea#plant_description[name=?]', 'plant[description]'
    end
  end
end
