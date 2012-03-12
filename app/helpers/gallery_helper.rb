# encoding: utf-8

module GalleryHelper

  def galeria_link(picture)
    image = EspCommons::Image.new(:url => picture.picture_url, :description => picture.description).parse_url
    link_to image_tag_for(image.create_thumbnail(:width => 200, :height => 128, :crop => true)), image.create_thumbnail(:width => 1050, :height => 700, :crop => true).url
  end

end
