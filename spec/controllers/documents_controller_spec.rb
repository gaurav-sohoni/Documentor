require 'spec_helper'

describe DocumentsController do

  #Delete this example and add some real ones
  it "should use DocumentsController" do
    controller.should be_an_instance_of(DocumentsController)
  end
  
  describe "GET new" do  
    it "creates a new document" do
      Block.should_receive(:find)
      Category.should_receive(:find)
      Document.should_receive(:new)
      get :new
    end
  end
  
  describe "POST create" do
    before(:each) do
      Block.stub(:find).with(params[:block_id]).and_return(@block)
      Category.stub(:find).with(params[:category_id]).and_return(@category)
    end
   
    it "should save the document" do
      Document.stub(:block).and_return(@block)
      Document.stub(:category).and_return(@category)
      
      Document.stub(:save).and_return(true)
      post :create, params
    end
  end
  
  
  describe "DELETE" do
    before(:each) do
      @document = mock_model(Document, :save => nil)
    end
    
    it "deletes document" do
      Document.should_receive(:find).with("21").and_return(@document)
      @document.should_receive(:destroy)
      delete :destroy, :id => "21"
    end
    
    it "redirects to blocks index" do
      Document.stub(:find).with('21').and_return(@document)
      @document.stub(:destroy).and_return(true)
      delete :destroy, :id => '21'
      response.should redirect_to(blocks_path)
    end
  end

end
