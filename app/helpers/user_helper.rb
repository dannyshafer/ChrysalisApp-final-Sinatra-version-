helpers do
  def current_user
    if session[:id]
      @current_user ||= User.where(id: session[:id]).first
    end
  end

  def logged_in?
    !!current_user
  end
end