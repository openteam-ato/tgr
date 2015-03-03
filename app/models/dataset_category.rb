class DatasetCategory < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :opendata_categories
end
