# frozen_string_literal: true

# To Store employees
class Employee < ApplicationRecord
  belongs_to :company, counter_cache: true

  after_create_commit :update_company_validity

  def update_company_validity
    company.update_validity!
  end
end
