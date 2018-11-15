class ApplicationController < ActionController::Base
  helper_method :default_avatar_path
  helper_method :current_user

  def default_avatar_path
    "/images/defaultAvatar.jpg"
  end

  def hello
    if current_user
      redirect_to users_path
    end
  end

   def current_user
     @user = User.find_by(id: session[:user_id])
   end

   def logged_in?
     current_user.id != nil
   end

   private

   def require_logged_in
     redirect_to controller: 'application', action: 'hello' unless current_user
   end




end
