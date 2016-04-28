class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(author: current_author))
    if @comment.save
      redirect_to post_path(@post), notice: "#{@comment.title} sucessfully created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment.update(comment_params.merge(author: current_author))
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: "#{@comment.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    @post = Post.find(params[:post_id])
    redirect_to @comment.post, notice: "#{@comment.title} destroyed."
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :author, :title, :post_id)
  end
end
