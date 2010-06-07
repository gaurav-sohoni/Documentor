require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {
      :name => 'CategoryOne',
      :has_expiry => true
    }
  end

  it "should create a new instance given valid attributes" do
    @category = Category.create!(@valid_attributes)
    @category.should be_valid
  end
  
  it "should be invalid without a name" do
    @category = Category.new(:name => '', :has_expiry => true)
    @category.should_not be_valid
    @category.attributes = @valid_attributes
    @category.should be_valid
  end
end
