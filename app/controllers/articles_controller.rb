class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :destroy, :show, :update]
  
  def index
    @articles = Article.all
  end
  
  def edit
  end
  
  def destroy 
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  def new
    @article = Article.new
  end
  
  def show
  end
  
  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash[:notice] = "Article was successfully edited"
    else
      render :edit
    end
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
      flash[:notice] = "Article was successfully created"
    else
      render :new
    end
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end