# frozen_string_literal: true

# Controller for handling employees
class EmployeesController < ApplicationController
  before_action :set_company

  def new
    @employee = @company.employees.new
  end

  def create
    employee = Employee.new(employee_params)

    respond_or_redirect(employee)
  end

  def show
    @employee = Employee.includes(:company).find params[:id]
  end

  def index
    @employees = if params[:company_id]
                   Employee.where(company_id: params[:company_id])
                 else
                   Employee.all
                 end
  end

  private

  def employee_params
    params.require(:employee).permit(:company_id)
  end

  def set_company
    return unless params[:company_id]

    @company = Company.find params[:company_id]
  end

  def respond_or_redirect(employee)
    respond_to do |format|
      if employee.save
        format.html do
          redirect_to(employee,
                      notice: 'Employee was successfully created.')
        end
      else
        format.html { render action: 'new', notice: 'An error occurred' }
      end
    end
  end
end
