class BooksController < ApplicationController

  def top
  end
  def index
  	@book = Book.new
  	#記事を全取得
  	@books =Book.all
  end
  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  def create
  	#DBへデータを保存
  	book = Book.new(book_params)
  	if book.save
  		flash[:notice] = "book was successfully created"
  		redirect_to book_path(book)
  	else
  		render("books/new")
  	end
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  	#ストロングパラメータを使う
  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
