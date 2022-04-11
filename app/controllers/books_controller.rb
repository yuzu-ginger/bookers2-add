class BooksController < ApplicationController
  # 投稿一覧
  def index
    @books = Book.all
    # 追加
    @book = Book.new
  end
  
  # 投稿詳細
  def show
    @book = Book.find(params[:id])
    # 追加
		@books =Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # 変更あり
    redirect_to books_path
  end
  
  # 投稿編集
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update
    redirect_to 
  end
  
  # 投稿削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
