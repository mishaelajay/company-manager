# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  def render_hash_tree(tree)
    content_tag :ul do
      tree.each_pair do |node, children|
        content = "#{node.name} #{node.employees_count} #{node.country}"
        content += render_hash_tree(children) if children.any?
        concat content_tag(:li, content)
      end
    end
  end
end
