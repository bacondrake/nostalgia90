class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in_user

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.date = Time.new.strftime("%d %b %Y")
    @article.author = current_user.name
    if @article.save
      redirect_to articles_path, notice: "New blog post successfully created"
    else
      render 'new'
    end
  end

  def index
    @articles = Article.order('date desc').paginate(:page => params[:page], :per_page => 20)
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "Blog post has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path, notice: "Blog post has been removed"
  end

  private
    def article_params
      params.require(:article).permit(
        :date,
        :title,
        :contents,
        :author
      )
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "You must log in to view this page"
        redirect_to login_url
      end
    end
end
