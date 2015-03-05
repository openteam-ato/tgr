class Dataset < ActiveRecord::Base
  attr_accessible :opendata_category_ids, :dataset_context_id, :opendata_id,
                  :tracking_number, :title, :description,
                  :owner, :responsible, :phone, :email,
                  :first_publish_date, :last_update_date,
                  :last_update_description, :relevance_date,
                  :keywords, :version_guidelines, :meta,
                  :attachments_attributes, :visits, :downloads

  attr_accessor   :dataset_context

  validates_presence_of :tracking_number, :dataset_context, :title, :description,
                        :owner, :responsible, :phone, :email,
                        :opendata_category_ids

  normalize_attributes  :tracking_number, :title, :description,
                        :owner, :responsible, :phone, :email,
                        :first_publish_date, :last_update_date,
                        :last_update_description, :relevance_date,
                        :keywords, :version_guidelines

  belongs_to :opendata

  has_many :attachments, :order => 'created_at DESC', :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true

  default_value_for :version_guidelines, 'Версия 3.0'

  default_value_for :visits, 0

  default_value_for :downloads, 0

  has_attached_file :meta, {
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url  => "/opendata/:tracking_number/:filename"
  }
  validates_attachment_file_name :meta, :matches => /\Ameta\..*\z/
  do_not_validate_attachment_file_type :meta

  has_and_belongs_to_many :opendata_categories, :order => :title, :readonly => true

  after_save :decoding_meta

  paginates_per 10

  scope :by_category, ->(category_id) { joins(:opendata_categories).where('opendata_categories.id = ?', category_id) }
  scope :by_context, ->(context_id) { where(:dataset_context_id => context_id) }

  def attachments_formats
    formats = []
    formats << meta_file_name.split('.').last if meta.present?
    attachments.each do |attachment|
      formats << attachment.data_file_name.split('.').last if attachment.data.present?
      formats << attachment.structure_file_name.split('.').last if attachment.structure.present?
    end

    formats.map(&:downcase).uniq.sort.join(', ')
  end

  def dataset_context
    if dataset_context_id.present?
      begin
        DatasetContext.find(dataset_context_id)
      rescue Exception => e
        nil
      end
    end
  end

  def self.search_categories
    self.all.map(&:opendata_categories).flatten.uniq.sort{ |a, b| a.title <=> b.title }
  end

  def self.search_contexts
    DatasetContext.find(self.pluck(:dataset_context_id).uniq).sort{ |a, b| a.title <=> b.title }
  end

  private

  def decoding_meta
    return unless meta.present?
    convert_command = <<-end_command
      enca -c #{meta.path}
    end_command

    system(convert_command)
  end

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
#  responsible             :text
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
#  dataset_context_id      :integer
#  visits                  :integer
#  downloads               :integer
#
