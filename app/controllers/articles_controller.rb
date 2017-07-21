class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :post_owner, only: :destroy

  def index
    @all_articles = Article.all
    #TODO artykuły w kolejności od najnowszego
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else

    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to articles_url
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def post_owner
    if current_user.nil?
      logged_in_user()
    else
      @article = current_user.articles.find_by(id: params[:id])
      if @article.nil?
        flash[:danger] = "You are not allowed to do that"
        redirect_to articles_url
      end
    end
  end
end
