class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @parents = Category.where(ancestry: nil)
    @user = current_user
  end

  def edit
  end

  private

  def users_params
    params.require(:user).permit(:nickname, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :image, :introduction, :user_id)
  end
end
