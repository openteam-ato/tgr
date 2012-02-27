module ApplicationHelper

  def render_navigation(hash)
    return '' if hash.nil? || hash.empty?
    content_tag :ul do
      hash.map do |key, value|
        content_tag :li, :class => value['selected'] ? :selected : nil do
          link_to(value['title'], value['path'], :class => key) +
            render_navigation(value['children'] || {})
        end
      end.join.html_safe
    end
  end

end
