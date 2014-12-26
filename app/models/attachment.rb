class Attachment < ActiveRecord::Base

  attr_accessible :data, :structure
  belongs_to :dataset
  delegate :tracking_number, :to => :dataset

  has_attached_file :data, {
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url  => "/opendata/:tracking_number/:filename"
  }
  do_not_validate_attachment_file_type :data

  has_attached_file :structure, {
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url  => "/opendata/:tracking_number/:filename"
  }
  do_not_validate_attachment_file_type :structure

  after_save :decoding_data
  after_save :decoding_structure

  private

  def decoding_data
    return unless data.present?
    convert_command = <<-end_command
      enca -c #{data.path}
    end_command

    system(convert_command)
  end

  def decoding_structure
    return unless structure.present?
    convert_command = <<-end_command
      enca -c #{structure.path}
    end_command

    system(convert_command)
  end
end

# == Schema Information
#
# Table name: attachments
#
#  id                     :integer          not null, primary key
#  dataset_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  data_file_name         :string(255)
#  data_content_type      :string(255)
#  data_file_size         :integer
#  data_updated_at        :datetime
#  structure_file_name    :string(255)
#  structure_content_type :string(255)
#  structure_file_size    :integer
#  structure_updated_at   :datetime
#
