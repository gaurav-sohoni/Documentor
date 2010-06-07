class Block < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :postcode
  validates_presence_of :build_date
  
  has_many :documents
  has_many :categories, :through => :documents 
end
