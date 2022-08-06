class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create 
    #render plain: params[:article] ==> return a plain text of hash "article"=>{"title"=>"hello rails", "description"=>"hello rails"} with the top-level key is :article
    # However, we can't pass params[:article] as Article.new(params[:article])
    # We need to whitelist this param to be accepted only sub-key are :title and :description fields because those are the one we allow and use in our application
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      #render plain: @article.inspect
      # article_path(@article) will query article.id to redirect to it's show.html
      # another way is to use "redirect_to @article"
      flash[:notice] = "Article was created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end
end