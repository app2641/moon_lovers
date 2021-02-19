# frozen_string_literal: true

class CreateNewMoons < ActiveRecord::Migration[6.1]
  def change
    create_table :new_moons do |t|
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
