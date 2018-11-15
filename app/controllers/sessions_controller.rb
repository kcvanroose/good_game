class SessionsController < ApplicationController

  def new
  end


  def create
    user = User.find_by(name: params[:name])

    user = user.try(:authenticate, params[:password])

    return redirect_to(controller: 'application', action: 'hello') unless user

    session[:user_id] = user.id

    @user = user

    redirect_to users_path
  end

  def destroy
    session.delete :user_id
    redirect_to controller: 'application', action: 'hello'
  end
end
