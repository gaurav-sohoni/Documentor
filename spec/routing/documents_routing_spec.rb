require 'spec_helper'

describe DocumentsController do
  describe "routing" do
    it "should recognize #index" do
      { :get => "/documents" }.should route_to(:controller => "documents", :action => "index")
    end

    it "should recognize #new" do
      { :get => "/documents/new" }.should route_to(:controller => "documents", :action => "new")
    end

    it "should recognize #show" do
      { :get => "/documents/1" }.should route_to(:controller => "documents", :action => "show", :id => "1")
    end

    it "should recognize #edit" do
      { :get => "/documents/1/edit" }.should route_to(:controller => "documents", :action => "edit", :id => "1")
    end

    it "should recognize #create" do
      { :post => "/documents" }.should route_to(:controller => "documents", :action => "create") 
    end

    it "rshould recognize #update" do
      { :put => "/documents/1" }.should route_to(:controller => "documents", :action => "update", :id => "1") 
    end

    it "should recognize #destroy" do
      { :delete => "/documents/1" }.should route_to(:controller => "documents", :action => "destroy", :id => "1") 
    end
  end
end
