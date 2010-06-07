require 'spec_helper'

describe CategoriesController do

  #Delete this example and add some real ones
  it "should use CategoriesController" do
    controller.should be_an_instance_of(CategoriesController)
  end
  
  describe "GET index" do
    it "assigns @categories for all categories" do
      Category.stub(:find).with(:all).and_return @category
      get :index
      assigns[:categories].should == @category
    end
  end
  
  describe "GET new" do
    it "assigns a new category as @category" do
      Category.stub(:new).and_return(@category)
      get :new
      assigns[:category].should equal(@category)
    end
  end
  
  describe "POST create" do
    
    before(:each) do
      @category = mock_model(Category, :save => nil)
      Category.stub(:new).and_return(@category)
    end
    
    it "creates a new category" do
      Category.should_receive(:new).with("parameters" => :params)
      post :create, :category =>{"parameters" => :params}
    end
    
    it "saves a new category" do
      @category.should_receive(:save)
      post :create
    end
    
    context "when the category saves successfully" do
      before(:each) do
        @category.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should == "Category was successfully created!"
      end
      
      it "redirects to the category index" do
        post :create
        response.should redirect_to(categories_path)
      end
      
    end
    
    context "when category fails to save" do
      before(:each) do
        @category.stub(:save).and_return(false)
      end
      
      it "assigns category" do
        post :create
        assigns[:category] == @category
      end
      
      it "renders the index template" do
        post :create
        response.should render_template('index')
      end
    end
  end
  
  describe "DELETE" do
    before(:each) do
      @category = mock_model(Category, :save => nil)
    end
    
    it "deletes category" do
      Category.should_receive(:find).with("21").and_return(@category)
      @category.should_receive(:destroy)
      delete :destroy, :id => "21"
    end
    
    it "redirects to blocks index" do
      Category.stub(:find).with('21').and_return(@category)
      @category.stub(:destroy).and_return(true)
      delete :destroy, :id => '21'
      response.should redirect_to(blocks_path)
    end
  end

end
