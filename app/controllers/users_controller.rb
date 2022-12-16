class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if Role.find_by(id: current_user[:roles_id]).can_destroy
      @user.destroy
      redirect_to users_path
    else
      redirect_to root_path, status: :unauthorized
    end
  end

  def edit
    # To do
  end
end
