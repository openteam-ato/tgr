# encoding: utf-8

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

  def event_interval(since_str, until_str)
    since_day, since_month, since_year, since_time = l(since_str.to_datetime, :format => :long).gsub(',', '').split(' ').to_a
    until_day, until_month, until_year, until_time = l(until_str.to_datetime, :format => :long).gsub(',', '').split(' ').to_a
    since_arr = []
    until_arr = []
    if since_year == until_year
      until_arr << until_year
    else
      since_arr << since_year
      until_arr << until_year
    end
    if since_month == until_month && since_day == until_day
      until_arr << "#{until_month},"
    else
      since_arr << since_month
      until_arr << "#{until_month},"
    end
    if since_month == until_month && since_day == until_day
      until_arr << until_day
    else
      since_arr << since_day
      until_arr << until_day
    end
    if since_time == until_time && since_month == until_month && since_day == until_day
      if since_time != '00:00'
        until_arr << until_time
      end
    else
      since_arr << since_time if since_time != '00:00'
      if until_time != '00:00'
        until_arr << until_time
        until_arr << "&mdash;"
      else
        until_arr << "&mdash;"
      end
    end
    until_arr.delete('23:59')
    (since_arr.reverse + until_arr.reverse).join(' ')
  end

  def get_link(navigation, object)
    link = navigation.to_hash.to_s.match(/#{object.title.gsub(/[[:space:]]/, ' ')}\", \"path\"=>\"(.*?)\"/).try(:[], 1)

    return link_to(object.title, link) if link

    return object.title
  end

  def extension(filename)
    filename.match(/\.(\w+)$/).try(:[], 1)
  end
end
