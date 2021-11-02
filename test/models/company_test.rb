# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
    test 'requirement_satisfied scope should return companies that satisfy employee requirements' do
        company = create(:company)
        assert_empty Company.requirement_satisfied

        valid_company = create(:company, :requirement_satisfied)
        assert_equal [valid_company], Company.requirement_satisfied
    end

    test 'requirement_unsatisfied should return companies that do not satisfy employee requirements' do
        valid_company = create(:company, :requirement_satisfied)
        assert_empty Company.requirement_unsatisfied
    
        company = create(:company)
        assert_equal [company], Company.requirement_unsatisfied
    end

    test 'creating sub company should update sub_company count' do
        company = create(:company)
        assert_equal 0, company.sub_company_count

        sub_company = create(:company, parent: company)
        assert_equal 1, company.sub_company_count
    end

    test 'increment_ancestral_emp_count! should update employee count for all ancestors' do
        company = create(:company)
        sub_company = create(:company, parent: company)
        sub_sub_company = create(:company, parent: sub_company )

        assert_equal 0, company.total_employees_count
        assert_equal 0, sub_company.total_employees_count
        assert_equal 0, sub_sub_company.total_employees_count
        assert_equal 0, sub_sub_company.employees_count

        sub_sub_company.increment_ancestral_emp_count!
        
        assert_equal 1, company.reload.total_employees_count
        assert_equal 1, sub_company.reload.total_employees_count
        assert_equal 1, sub_sub_company.reload.total_employees_count
    end
end
