# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'requirement_satisfied scope should return companies that satisfy employee requirements' do
    create(:company)
    assert_empty Company.requirement_satisfied

    valid_company = create(:company, :requirement_satisfied)
    assert_equal [valid_company], Company.requirement_satisfied
  end

  test 'requirement_unsatisfied should return companies that do not satisfy employee requirements' do
    create(:company, :requirement_satisfied)
    assert_empty Company.requirement_unsatisfied

    company = create(:company)
    assert_equal [company], Company.requirement_unsatisfied
  end

  test 'creating sub company should update sub_company count' do
    company = create(:company)
    assert_equal 0, company.sub_company_count

    create(:company, parent: company)
    assert_equal 1, company.sub_company_count
  end

  test 'increment_ancestral_emp_count! should update employee count for all ancestors' do
    company = create(:company)
    sub_company = create(:company, parent: company)
    sub_sub_company = create(:company, parent: sub_company)

    assert_total_emp_count([company, sub_company, sub_sub_company], 0)

    sub_sub_company.increment_ancestral_emp_count!

    assert_total_emp_count([company, sub_company, sub_sub_company], 1)
  end
end
