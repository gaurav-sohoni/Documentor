class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.column :name, :string
      t.column :has_expiry, :boolean
      t.timestamps
    end
    
    # initial data being loaded from fixtures   
    #names = ['Management Agreement', 'Fire Risk Agreement', 'Asbestos Survey']
    #names.each do |name|
    #  Category.create!(:name => name, :has_expiry => true)
    #end
  end

  def self.down
    drop_table :categories
  end
end
