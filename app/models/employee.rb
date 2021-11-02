# frozen_string_literal: true

# To Store employees
class Employee < ApplicationRecord
  belongs_to :company, counter_cache: true
  
  after_create_commit :increment_company_emp_count
  after_destroy_commit :decrement_company_emp_count

  def increment_company_emp_count
    company.increment_ancestral_emp_count!
  end

  def decrement_company_emp_count
    company.decrement_ancestral_emp_count!
  end
end
