# frozen_string_literal: true

# class for creating results table
class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :key, null: false, unique: true
      t.integer :squared, array: true, null: false

      t.timestamps
    end
  end
end
