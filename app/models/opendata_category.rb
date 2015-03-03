class OpendataCategory < ActiveRecord::Base
  attr_accessible :title

  validates :title, :uniqueness => true

  scope :ordered, -> { order('title') }

  normalize_attributes :title
end

# == Schema Information
#
# Table name: opendata_categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
