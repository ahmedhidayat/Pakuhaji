class ArticlesController < ApplicationController
  before_action :check_current_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  layout "admin_application"
  def index
    @article = Article.page(params[:page]) .per(5)
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

   def update
     @article = Article.find_by_id(params[:id])
      if @article.update(article_params)
      flash[:notice] = "Success Update Record"
      redirect_to action: 'index'
    else
      flash[:error] = "Data Not Valid"
      render 'edit'
    end
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
  end

  def show
      @article = Article.find_by_id(params[:id])
      render layout: "application"
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

  
