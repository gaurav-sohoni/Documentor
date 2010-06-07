require 'spec_helper'

describe "/documents/new.html.erb" do
  include DocumentsHelper

  before(:each) do
    block = mock_model(Block, :name => 'Some Name', :postcode => "AAA E12", :build_date => '1977/06/20')
    category = mock_model(Category, :name => 'Some Category', :has_expiry => true)
    assigns[:block] = block
    assigns[:category] = category

    assigns[:document] = stub_model(Document,
      :new_record? => true
    )
  end

  it "renders new document form" do
    render

    response.should have_tag("form[method=post]", :action => documents_path, :block_id => 1, :category_id =>   2) do
    end
  end
end

