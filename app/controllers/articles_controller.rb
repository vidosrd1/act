class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all.order('created_at DESC')
    #@articles.limit(per_page).offset(paginate_offset)
    #@pagy, @blogs =
    #pagy(Blog.order(created_at: :desc),
    #items: 5)
    @pagy, @articles = pagy(Article.
      order(created_at: :desc))
    #pagy(@blogs)
    if params[:query].present?
      @articles = Article.where("title LIKE ?", "%#{params[:query]}%")
    #else
    end

    if turbo_frame_request?
      render partial: "articles",
      locals: { articles: @articles }
    else
      render :index
    end
  rescue Pagy::OverflowError
    #redirect_to root_path(page: 1)
    params[:page] = 1
    retry
  end

  def show
    @articles = Article.all.order('created_at DESC')
    @pagy, @articles = pagy(Article.
      order(created_at: :desc))
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(#:user_id,
        :title, :image, :body, :publish,
        :tag_id, pictures: [])
        .with_defaults(user: current_user)
    end

    def current_user
      User.first
    end
end
