class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many    :documents
  has_many    :blocks, :through => :documents
  
end
