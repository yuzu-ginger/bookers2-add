class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  
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
    if @user.update(user_params)
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
