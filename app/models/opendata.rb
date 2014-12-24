class Opendata < ActiveRecord::Base
  attr_accessible :list
  validates_presence_of :list

  has_attached_file :list, {
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url  => "/opendata/:filename"
  }

  do_not_validate_attachment_file_type :list

end

# == Schema Information
#
# Table name: opendata
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  list_file_name    :string(255)
#  list_content_type :string(255)
#  list_file_size    :integer
#  list_updated_at   :datetime
#
