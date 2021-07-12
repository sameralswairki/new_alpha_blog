class ArticlesController < ApplicationController
  #applying DRY which represent to don't repeat yourself
  #by using set_article method definded at the end of Article controller
  before_action :set_article, only: [:show, :edit, :update, :destroy] 

  def show
    #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article]
    #we need below to white list what we are getting from the browser first: it is called strong parameter
    @article = Article.new(article_params)
    #render plain: @article.inspect
    if @article.save
      #below flash message needs to be iterated in application.html.erb main file to be seen right after the creation of an article
      flash[:notice] = "Article was created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    #redirect_to @article
    # or a shorter code for the same output as above
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private 

  def set_article 
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end