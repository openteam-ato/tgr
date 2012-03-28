module ApplicationHelper

  def render_navigation(hash)
    return '' if hash.nil? || hash.empty?
    content_tag :ul do
      hash.map do |key, value|
        content_tag :li, :class => value['selected'] ? 'selected' : nil do
          link_to(value['title'], value['path'])+render_navigation(value['children'])
        end
      end.join.html_safe
    end
  end

  def render_partial_for_region(region)
    if region && (region.response_status == 200 || !region.response_status?)
      render :partial => "regions/#{region.template}",
      :locals => { :object => region.content, :response_status => region.response_status }
    else
      render :partial => 'regions/error', :locals => { :region => region }
    end
  end

  def get_link(navigation, object)
    link = navigation.to_hash.to_s.match(/#{object.title}\", \"path\"=>\"(.*?)\"/).try(:[], 1)

    return link_to(object.title, link) if link

    return object.title
  end
end
