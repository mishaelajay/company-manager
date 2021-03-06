# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  # rubocop:disable Rails/OutputSafety
  def render_hash_tree(tree)
    content_tag :ul do
      tree.each_pair do |node, children|
        name = node.name
        employee_count = "#{node.employees_count}/#{node.required_employees_count}"
        requirement_satisfied = node.requirement_satisfied
        content = [name, employee_count, requirement_satisfied].join(' ')
        content += render_hash_tree(children) if children.any?
        concat content_tag(:li, content.html_safe)
      end
    end
  end
  # rubocop:enable Rails/OutputSafety
end
