class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.column :doc_file_name, :string
      t.column :doc_content_type, :string
      t.column :doc_file_size, :string
      t.column :category_id, :integer
      t.column :block_id, :integer
      t.column :expires_on, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
