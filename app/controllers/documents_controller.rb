class DocumentsController < ApplicationController
  def index
  end
  
  def new
    @block = Block.find(params[:block_id])
    @category = Category.find(params[:category_id])
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    @document.block = Block.find(params[:block_id])
    @document.category = Category.find(params[:category_id])
    if @document.save
      flash[:notice] = 'Document was successfully uploaded.'
    else
      flash[:error] = 'Document Upload failed!'
    end
    redirect_to blocks_url
  end
  
  def show
    document = Document.find(params[:id])
    send_file document.doc.url, :type => document.doc_content_type, :disposition => 'attachment'
  end
  
  def destroy
    document = Document.find(params[:id])
    document.destroy
    
    respond_to do |format|
      format.html {redirect_to blocks_url}
      format.xml {head :ok}
    end
  end

end
