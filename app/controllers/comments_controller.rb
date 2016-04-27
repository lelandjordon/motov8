class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create

    if @comment.save
      redirect_to @comment.post, notice: "#{@comment.title} sucessfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:post_id])
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: "#{@comment.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy

    redirect_to comments_path, notice: "#{@comment.title} destroyed."
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :author, :title, :post_id)
  end
end
