class CategoriesController < ApplicationController
  
  def index
    @categories = Category.find(:all)
    @category = Category.new
  end
  
  def new
    @category = Category.new
    respond_to do |format|
      format.html
      format.xml {render :xml => @category}
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @category}
    end
  end

  def create
    @categories = Category.find(:all)
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        flash[:notice] = "Category was successfully created!"
        format.html {redirect_to categories_url}
        format.xml {head :ok }
      else
        format.html {render :action => 'index'}
        format.xml {render :xml => @category.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    respond_to do |format|
      format.html {redirect_to blocks_url}
      format.xml {head :ok}
    end
  end

end
