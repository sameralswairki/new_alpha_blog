class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    #render plain: params[:article]
    #we need below to white list what we are getting from the browser first: it is called strong parameter
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect
    @article.save
    #redirect_to article_path(@article)
    # or a shorter code for the same output
    redirect_to @article
  end
end