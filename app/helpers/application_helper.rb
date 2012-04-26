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

  def interval_for(event)
    since_day, since_month, since_year, since_time = l(event.since.to_datetime, :format => '%d %B %Y %H:%M').split(' ')
    until_day, until_month, until_year, until_time = l(event.until.to_datetime, :format => '%d %B %Y %H:%M').split(' ')

    since_arr = []
    until_arr = []

    if since_year == until_year
      until_arr << until_year
    else
      since_arr << since_year
      until_arr << until_year
    end

    if since_month == until_month && since_day == until_day
      until_arr << "#{until_month}"
    else
      since_arr << since_month
      until_arr << "#{until_month}"
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
    (since_arr.reverse + until_arr.reverse).join(' ').html_safe
  end

  def archive_links(current_events, nearest_events, gone_events, base_path)
    @events = [current_events, nearest_events, gone_events].map(&:border_dates)

    result = '<ul>'

    monthes_by_year.each do |year, dates|
      result += '<li>'
      result += link_to(year, '#', :class => 'year')
      result += '<ul>'
      result += dates.reverse.map{ |date| content_tag(:li, link_to(t('date.month_names')[date.month], "#{base_path}/monthly/?parts_params[news_list][interval_year]=#{year}&parts_params[news_list][interval_month]=#{date.month}")) }.join('')
      result += '</ul></li>'
    end

    result += '</ul>'

    result.html_safe
  end

  def monthes_by_year
    (early_date..lately_date).select{|m| m.day == 1 }.group_by(&:year)
  end

  def early_date
    @events.map(&:min_date).map(&:to_date).min.strftime('01-%B-%Y').to_date
  end

  def lately_date
    @events.map(&:max_date).map(&:to_date).max
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
