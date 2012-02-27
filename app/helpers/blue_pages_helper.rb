# encoding: utf-8

module BluePagesHelper
  def render_blue_pages(hash)
      result = content_tag(:h1, content_tag(:span, hash['title']))
      result << content_tag(:p, "Адрес: #{hash['address']}")

      if hash['phones']
        result << content_tag(:p, hash['phones'])
      end

      if hash['emails']
        result << content_tag(:p, 'Адреса электронной почты:')
        block = ''
        hash['emails'].each do |email|
          block << content_tag(:li, email)
        end
        result << content_tag(:ul, block.html_safe)
      end

      if hash['dossier']
        result << hash['dossier'].html_safe
      end

      if hash['items']

        hash['items'].each do |item|
          person = ''
          person << content_tag(:h3, item['title'])
          person << content_tag(:p, link_to(item['person'], item['link']), :class => 'name')
          person << content_tag(:p, [item['phones']].compact.join(','), :class => 'phones') unless item['phones'].blank?
          person << content_tag(:p, [item['emails'].collect{|x| mail_to(x)}].compact.join(',').html_safe, :class => 'emails') unless item['emails'].blank?
          person << content_tag(:p, item['address'], :class => 'address') unless item['address'].blank?
          result << content_tag(:div, person.html_safe, :class => 'person')
        end
      end

      hash['subdivisions'].each do |subdivision|
        result << render_blue_pages(subdivision)
      end if hash['subdivisions']

      result
  end
end
