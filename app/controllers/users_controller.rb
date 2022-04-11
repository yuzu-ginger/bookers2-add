class UsersController < ApplicationController
  # ユーザ一覧
  def index
    @users = User.all
    @book = Book.new
  end
  
  # ユーザ詳細
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  # ユーザ編集
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
