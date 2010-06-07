require 'spec_helper'

describe Block do
  before(:each) do
    @block = Block.new
    @valid_attributes = {
      :name => "Gaurav Sohoni",
      :postcode => "AA0 0EF",
      :build_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    @block = Block.create!(@valid_attributes)
    @block.should be_valid
  end
  
  it "should be invalid without a name attribute" do
    @block.attributes = @valid_attributes.except(:name)
    @block.should_not be_valid
    @block.name = 'Gaurav'
    @block.should be_valid
  end
  
  it "should be invalid without a build_date attribute" do
    @block.attributes = @valid_attributes.except(:build_date)
    @block.should_not be_valid
    @block.build_date = '2001-05-05'
    @block.should be_valid
  end
  
  it "should be invalid without a postcode attribute" do
    @block.attributes = @valid_attributes.except(:postcode)
    @block.should_not be_valid
    @block.postcode = 'ABC 0EF'
    @block.should be_valid
  end
end
