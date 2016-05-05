class PostsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @post.author = current_author
    if @post.save
      redirect_to @post, notice: "#{@post.title} sucessfully created."
    else
      render :new
    end
  end
  # nice use of error handling and user notices

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "#{@post.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: "#{@post.title} sucessfully destroyed"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end
