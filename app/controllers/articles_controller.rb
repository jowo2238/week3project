class ArticlesController < ApplicationController
  def show 
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
    
  end
  
  def index 
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
      
  include ArticlesHelper
  
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
    flash.notice = "Article '#{@article.title}' Created!"
  end
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
    
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end
end
