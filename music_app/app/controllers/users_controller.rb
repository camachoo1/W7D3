class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
