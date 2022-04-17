class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user= User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path, alert: "ちょっと何やってるんですか？"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールの更新したよー！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
