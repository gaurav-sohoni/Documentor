class Document < ActiveRecord::Base
  belongs_to :block
  belongs_to :category
  
  has_attached_file :doc, :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension", :url => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"

  validates_attachment_presence :doc
  
  
  def expired?
    return self.expires_on < Time.now
  end
end
