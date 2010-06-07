require 'spec_helper'

describe "/categories/index.html.erb" do
  include CategoriesHelper

  before(:each) do
    category = mock_model(Category, :name => 'Some Category', :has_expiry => true)
    assigns[:categories] = [category]
    assigns[:category] = stub_model(Category,
      :new_record? => true
    )
  end
  
  it "renders a list of categories and a new category form" do
    render
    response.should have_tag("form[method=post][action=?]", categories_path) do
    end
  end
end
