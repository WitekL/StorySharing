class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @all_articles = Article.all
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

  def show
    @article = Article.find_by(id: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
