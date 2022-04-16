class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  # 投稿一覧
  def index
    @books = Book.all
    @book = Book.new
  end
  
  # 投稿詳細
  def show
    @book = Book.find(params[:id])
		@books =Book.new
		@user = @book.user
		@book_comment = BookComment.new
  end
  
  # 新規投稿
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # バリデーション
    if @book.save
      redirect_to @book, notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end
  
  # 投稿編集
  def edit
    @book = Book.find(params[:id])
  end
  
  # 更新
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
  		redirect_to @book, notice: "You have updated book successfully."
  	else
			render :edit
  	end
  end
  
  # 投稿削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
  		redirect_to books_path
  	end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
