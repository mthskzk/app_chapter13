class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    # 1,2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. index
    redirect_to '/books/:id'
  end


  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end


