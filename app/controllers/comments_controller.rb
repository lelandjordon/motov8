class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: "#{@comment.title} sucessfully created."
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment, notice: "#{@comment.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path, notice: "#{@comment.title} destroyed."
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :author, :title, :post_id)
  end
end
