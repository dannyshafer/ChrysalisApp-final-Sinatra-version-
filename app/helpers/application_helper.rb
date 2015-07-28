helpers do
 def current_user
   # if the user exists, it returns the user
   if session[:user_id].present?
     return User.find(session[:user_id])
   # otherwise, it returns nil
   end
 end
end
