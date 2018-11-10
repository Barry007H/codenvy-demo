# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
    add_index :rooms, :name, unique: true
  end
end
