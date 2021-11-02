# frozen_string_literal: true

# To store companies
class Company < ApplicationRecord
  scope :requirement_satisfied, -> { where(requirement_satisfied: true) }
  scope :requirement_unsatisfied, -> { where(requirement_satisfied: false) }

  has_many :employees,
           inverse_of: :company,
           dependent: :nullify

  acts_as_nested_set counter_cache: :sub_company_count

  def satisfies_requirement?
    total_employees_count >= required_employees_count
  end

  def update_validity
    self.requirement_satisfied = true if satisfies_requirement?
  end

  def update_validity!
    update_validity
    save!
  end

  def increment_total_emp_count
    self.total_employees_count += 1
  end

  def increment_total_emp_count!
    increment_total_emp_count
    save!
  end

  def decrement_total_emp_count
    self.total_employees_count -= 1
  end

  def decrement_total_emp_count!
    decrement_total_emp_count
    save!
  end

  def increment_ancestral_emp_count!
    ActiveRecord::Base.transaction do
      self_and_ancestors.each do |company|
        company.increment_total_emp_count!
        company.update_validity!
      end
    end
  end

  def decrement_ancestral_emp_count!
    ActiveRecord::Base.transaction do
      self_and_ancestors.each do |company|
        company.decrement_total_emp_count!
        company.update_validity!
      end
    end
  end
end
