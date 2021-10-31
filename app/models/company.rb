# frozen_string_literal: true

# To store companies
class Company < ApplicationRecord
  scope :requirement_satisfied, -> { Company.where(requirement_satisfied: true) }
  scope :requirement_unsatisfied, -> { Company.where(requirement_satisfied: false) }

  has_many :employees,
           inverse_of: :company,
           dependent: :nullify

  acts_as_nested_set counter_cache: :sub_company_count

  def total_employees_count
    self_and_descendants.pluck(:employees_count).sum
  end

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
end
