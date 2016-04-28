class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_author
  def current_author
    if session[:author_id]
      return Author.find(session[:author_id])
    else
      return nil
    end
  rescue ActiveRecord::RecordNotFound  # only fix this error, which was thrown in the browser.
    session[:author_id] = nil
    return nil
  end
  # rescue, a Ruby feature, errors in Rails does this stuff

  alias :current_user :current_author
  helper_method :current_user

end
