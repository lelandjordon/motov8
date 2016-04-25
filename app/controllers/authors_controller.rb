class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to posts_path, notice: "Signed Up Sucessfully!"
    else
      render :new
    end
  end

  private
  def author_params
    params.require(:author).permit(:email, :password, :password_confirmation)
  end
end
