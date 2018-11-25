# frozen_string_literal: true

class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.text :description, null: true

      t.timestamps
    end

    add_index :plants, :code, unique: true
  end
end
