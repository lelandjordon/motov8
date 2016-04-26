class SessionsController < ApplicationController
  def new
  end

  def create
    # does the author exist with the email provided?
    author = Author.find_by(email: params[:email])

    if author
      # does their password match?
      if author.authenticate(params[:password])
        # if so, log them in
        session[:author_id] = author.id
        flash[:notice] = "Logged in as #{author.email}!"
        redirect_to posts_path
      else
        # else, send them back to the log in form
        render :new and return
      end
    else
      # incorrect email (no author with that email)
      # else, send them back to the log in form
      render :new and return
    end

  end

  def destroy
    session[:author_id] = nil
    redirect_to posts_path, notice: "Signed out!"
  end

end
