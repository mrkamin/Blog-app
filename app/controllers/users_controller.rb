class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to new_user_session_path
    else
      @user = User.find_by(id: params[:id])
      redirect_to users_path, alert: 'User not found' unless @user
    end
  end
end
