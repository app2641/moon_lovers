# frozen_string_literal: true

class CreateMoonAges < ActiveRecord::Migration[6.1]
  def change
    create_table :moon_ages do |t|
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :state, null: false, default: 0
      t.date :date, null: false
      t.datetime :datetime, null: false

      t.timestamps
    end
  end
end
