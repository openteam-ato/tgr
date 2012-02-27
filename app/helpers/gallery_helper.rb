# encoding: utf-8

module GalleryHelper

  def prepare_picture_url(url)
    url.insert(url.rindex('/'), '/700-700')
  end

end
