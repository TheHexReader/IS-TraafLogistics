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
    @user = User.find_by(id: params[:id])
    @roles = Role.all
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: :success
    else
      render :edit, status: :unprocessable_entity
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :roles_id, :password)
  end
end
