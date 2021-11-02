# frozen_string_literal: true

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'creating a new employee must increment employee count for company' do
    company = create(:company)
    assert_equal 0, company.employees_count

    create(:employee, company: company)
    assert_equal 1, company.employees_count
  end

  test 'creating/destroying an employee for a sub company must update all parent companies total employee count' do
    company = create(:company)
    sub_company = create(:company, parent: company)
    sub_sub_company = create(:company, parent: sub_company)

    assert_total_emp_count([company, sub_company, sub_sub_company], 0)
    assert_equal 0, sub_sub_company.employees_count

    employee = create(:employee, company: sub_sub_company)

    assert_total_emp_count([company, sub_company, sub_sub_company], 1)
    assert_equal 1, sub_sub_company.employees_count

    employee.destroy!

    assert_total_emp_count([company, sub_company, sub_sub_company], 0)
    assert_equal 0, sub_sub_company.employees_count
  end
end
