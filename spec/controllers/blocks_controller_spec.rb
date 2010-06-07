require 'spec_helper'
require 'block'

describe BlocksController do
  #Delete this example and add some real ones
  it "should use BlocksController" do
    controller.should be_an_instance_of(BlocksController)
  end
  
  describe "GET index" do
    it "assigns @blocks for all blocks" do
      Block.stub(:find).with(:all).and_return @blocks
      get :index
      assigns[:blocks].should == @blocks
    end
  end
  
  describe "GET new" do
    it "assigns a new block as @block" do
      Block.stub(:new).and_return(@block)
      get :new
      assigns[:block].should equal(@block)
    end
  end
  
  describe "POST create" do
    
    before(:each) do
      @block = mock_model(Block, :save => nil)
      Block.stub(:new).and_return(@block)
    end
    
    it "creates a new block" do
      Block.should_receive(:new).with("parameters" => :params)
      post :create, :block =>{"parameters" => :params}
    end
    
    it "saves a new block" do
      @block.should_receive(:save)
      post :create
    end
    
    context "when the block saves successfully" do
      before(:each) do
        @block.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should == "Block was successfully created!"
      end
      
      it "redirects to the blocks index" do
        post :create
        response.should redirect_to(blocks_path)
      end
      
    end
    
    context "when block fails to save" do
      before(:each) do
        @block.stub(:save).and_return(false)
      end
      
      it "assigns block" do
        post :create
        assigns[:block] == @block
      end
      
      it "renders the block new template" do
        post :create
        response.should render_template('new')
      end
    end
  end
  
  describe "DELETE" do
    before(:each) do
      @block = mock_model(Block, :save => nil)
    end
    
    it "deletes block" do
      Block.should_receive(:find).with("21").and_return(@block)
      @block.should_receive(:destroy)
      delete :destroy, :id => "21"
    end
    
    it "redirects to blocks index" do
      Block.stub(:find).with('21').and_return(@block)
      @block.stub(:destroy).and_return(true)
      delete :destroy, :id => '21'
      response.should redirect_to(blocks_path)
    end
  end

end
