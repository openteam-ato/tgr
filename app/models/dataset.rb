class Dataset < ActiveRecord::Base
  attr_accessible :opendata_id, :tracking_number, :title, :description,
                  :owner, :responsible, :phone, :email,
                  :first_publish_date, :last_update_date,
                  :last_update_description, :relevance_date,
                  :keywords, :version_guidelines, :meta

  validates_presence_of :tracking_number, :title, :description,
                        :owner, :responsible, :phone, :email

  normalize_attributes  :tracking_number, :title, :description,
                        :owner, :responsible, :phone, :email,
                        :first_publish_date, :last_update_date,
                        :last_update_description, :relevance_date,
                        :keywords, :version_guidelines

  belongs_to :opendata

  default_value_for :version_guidelines, 'Версия 3.0'

  has_attached_file :meta, {
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url  => "/opendata/:tracking_number/:filename"
  }
  do_not_validate_attachment_file_type :meta

end

# == Schema Information
#
# Table name: datasets
#
#  id                      :integer          not null, primary key
#  opendata_id             :integer
#  tracking_number         :string(255)
#  title                   :text
#  description             :text
#  owner                   :text
#  responsible             :string(255)
#  phone                   :string(255)
#  email                   :string(255)
#  first_publish_date      :date
#  last_update_date        :date
#  last_update_description :text
#  relevance_date          :date
#  keywords                :text
#  version_guidelines      :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  meta_file_name          :string(255)
#  meta_content_type       :string(255)
#  meta_file_size          :integer
#  meta_updated_at         :datetime
#
