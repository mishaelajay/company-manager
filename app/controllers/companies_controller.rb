# frozen_string_literal: true

# controller to handle companies
class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @all_companies = Company.all
  end

  def create
    @company = Company.new(company_params)

    respond_or_redirect(@company)
  end

  def index
    @companies = if params[:valid].present?
                   if params[:valid] == true
                     Company.requirement_satisfied.order(:lft)
                   else
                     Company.requirement_unsatisfied.order(:lft)
                   end
                 else
                   Company.all.order(:lft)
                 end
    @companies_tree = build_hash_tree(@companies)
  end

  def show
    @company = Company.find params[:id]
    @company_tree = build_hash_tree(@company.self_and_descendants)
  end

  def destroy; end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :parent_id,
      :required_employees_count,
      :country
    )
  end

  def respond_or_redirect(company)
    respond_to do |format|
      if company.save
        format.html do
          redirect_to(company,
                      notice: 'Company was successfully created.')
        end
      else
        format.html { render action: 'new', notice: 'An error occurred' }
      end
    end
  end

  def build_hash_tree(tree_scope)
    tree = ActiveSupport::OrderedHash.new
    id_to_hash = {}

    tree_scope.each do |ea|
      h = id_to_hash[ea.id] = ActiveSupport::OrderedHash.new
      (id_to_hash[ea.parent_id] || tree)[ea] = h
    end
    tree
  end
end
