class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  def index
    @blogs = Blog.all#.order('created_at DESC')
    #@pagy, @blogs =
    #pagy(Blog.order(created_at: :desc),
    #items: 5)
    @pagy, @blogs = pagy(Blog.
      order(created_at: :desc))
    #pagy(@blogs)
    if params[:query].present?
      @blogs = Blog.where("title LIKE ?", "%#{params[:query]}%")
    #else
    end

    # Not too clean but it works!
    if turbo_frame_request?
      render partial: "blogs",
      locals: { blogs: @blogs }
    else
      render :index
    end
  rescue Pagy::OverflowError
    #redirect_to root_path(page: 1)
    params[:page] = 1
    retry
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title,
        :body, :publish, :category_id)
    end
end
