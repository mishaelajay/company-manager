# frozen_string_literal: true

# Migration to add companies table
class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.name
      t.references :company,
                   null: false,
                   foreign_key: { to_table: :companies }
      t.timestamps
    end
  end
end
