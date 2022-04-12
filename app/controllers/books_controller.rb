class BooksController < ApplicationController
  # 投稿一覧
  def index
    @books = Book.all
    @book = Book.new
  end
  
  # 投稿詳細
  def show
    @book = Book.find(params[:id])
		@books =Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    # バリデーション
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end
  
  # 投稿編集
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
  		redirect_to book_path
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
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
