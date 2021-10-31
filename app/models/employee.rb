# frozen_string_literal: true

# To Store employees
class Employee < ApplicationRecord
  belongs_to :company, counter_cache: true

  after_create_commit :update_ancestral_emp_count

  def update_ancestral_emp_count
    company.update_ancestral_emp_count!
  end
end
