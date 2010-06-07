require 'spec_helper'

describe CategoriesController do
  describe "routing" do
    it "should recognize #index" do
      { :get => "/categories" }.should route_to(:controller => "categories", :action => "index")
    end

    it "should recognize #new" do
      { :get => "/categories/new" }.should route_to(:controller => "categories", :action => "new")
    end

    it "should recognize #create" do
      { :post => "/categories" }.should route_to(:controller => "categories", :action => "create") 
    end

    it "should recognize #destroy" do
      { :delete => "/categories/1" }.should route_to(:controller => "categories", :action => "destroy", :id => "1") 
    end
  end
end
