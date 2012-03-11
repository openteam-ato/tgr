# encoding: utf-8

module GalleryHelper

  def galeria_link(picture)
    image = EspCommons::Image.new(:url => picture.picture_url).parse_url
    link_to image_tag_for(image.create_thumbnail(:width => 200, :height => 150)), image.create_thumbnail(:width => 1024, :height => 768).url
  end

end
