class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    authorize! :read, @post
  end

  def new
    @post = Post.new
    authorize! :create, @post
  end

  def create
    @post = Post.new(post_params)
    authorize! :create, @post
    @post.author = current_author
    if @post.save
      redirect_to @post, notice: "#{@post.title} sucessfully created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :update, @post
  end

  def update
    @post = Post.find(params[:id])
    authorize! :update, @post
    if @post.update(post_params)
      redirect_to @post, notice: "#{@post.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy

    redirect_to posts_path, notice: "#{@post.title} sucessfully destroyed"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
