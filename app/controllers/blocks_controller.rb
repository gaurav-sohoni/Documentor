class BlocksController < ApplicationController
  
  def index
    @blocks = Block.find(:all)
    @categories = Category.find(:all)
  end
  
  def list
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @block = Block.new
    respond_to do |format|
      format.html
      format.xml {render :xml => @block}
    end
  end
  
  def create
    @block = Block.new(params[:block])
    respond_to do |format|
      if @block.save
        flash[:notice] = "Block was successfully created!"
        format.html {redirect_to blocks_url}
        format.xml {head :ok }
      else
        format.html {render :action => 'new'}
        format.xml {render :xml => @block.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  def destroy
    block = Block.find(params[:id])
    block.destroy
    
    respond_to do |format|
      format.html {redirect_to blocks_url}
      format.xml {head :ok}
    end
  end

end
