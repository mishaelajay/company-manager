# frozen_string_literal: true

# Migration to add companies table
class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :sub_company_count, default: 0
      t.integer :employees_count, default: 0
      t.integer :required_employees_count, default: 0
      t.boolean :requirement_satisfied, default: false
      t.string :country
      t.integer :parent_id, index: true
      t.integer :lft, index: true
      t.integer :rgt, index: true
      t.integer :depth, index: true
      t.timestamps
    end
  end
end
