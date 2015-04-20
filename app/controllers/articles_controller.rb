class ArticlesController < ApplicationController
  before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @article = Article.all
  end
  
  def new
    @article = Article.new
  end

   def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

  def edit
  end

  def show
      @article = Article.find_by_id(params[:id])
  end
  
   def destroy
     @article = Article.find_by_id(params[:id])
      if @article.destroy
      flash[:notice] = "Success Delete a Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
    
  end

private
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :picture)
    end
end

  
