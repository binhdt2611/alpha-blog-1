class ArticlesController < ApplicationController
  # before_action will perform this set_article action before we do anything of these method below 
  # only: [list of :symbol] to affect only methods we want
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create 
    #render plain: params[:article] ==> return a plain text of hash "article"=>{"title"=>"hello rails", "description"=>"hello rails"} with the top-level key is :article
    # However, we can't pass params[:article] as Article.new(params[:article])
    # We need to whitelist this param to be accepted only sub-key are :title and :description fields because those are the one we allow and use in our application
    @article = Article.new(article_params)
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
    if @article.update(article_params)
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # private means any actions or methods put below it are only available to its controller
  # They're not gonna be available for use outside controller
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end