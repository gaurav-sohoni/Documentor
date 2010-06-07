require 'spec_helper'

describe "/blocks/index.html.erb" do
  include BlocksHelper

  before(:each) do
    block = mock_model(Block, :name => 'Some Name', :postcode => "AAA E12", :build_date => '1977/06/20')
    category = mock_model(Category, :name => 'Some Category')
    assigns[:block] = block
    assigns[:blocks] = [block]
    assigns[:categories] = [category]
    template.stub!(:format_date).and_return(true)
    template.should_receive(:format_date).at_least(:once).and_return(true)
  end

  it "renders a list of blocks and categories" do
    render
  end
end
