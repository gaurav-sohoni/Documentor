require 'spec_helper'

describe BlocksController do
  describe "routing" do
    it "should recognize #index" do
      { :get => "/blocks" }.should route_to(:controller => "blocks", :action => "index")
    end

    it "should recognize #new" do
      { :get => "/blocks/new" }.should route_to(:controller => "blocks", :action => "new")
    end

    it "should recognize #show" do
      { :get => "/blocks/1" }.should route_to(:controller => "blocks", :action => "show", :id => "1")
    end

    it "should recognize #edit" do
      { :get => "/blocks/1/edit" }.should route_to(:controller => "blocks", :action => "edit", :id => "1")
    end

    it "should recognize #create" do
      { :post => "/blocks" }.should route_to(:controller => "blocks", :action => "create") 
    end

    it "rshould recognize #update" do
      { :put => "/blocks/1" }.should route_to(:controller => "blocks", :action => "update", :id => "1") 
    end

    it "should recognize #destroy" do
      { :delete => "/blocks/1" }.should route_to(:controller => "blocks", :action => "destroy", :id => "1") 
    end
  end
end
