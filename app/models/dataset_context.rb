class DatasetContext < ActiveRecord::Base
  attr_accessible :ancestry, :title, :weight

  def to_s
    title
  end

  def to_json
    { title => id }
  end
end

# == Schema Information
#
# Table name: dataset_contexts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  ancestry   :string(255)
#  weight     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
