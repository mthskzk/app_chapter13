class BooksController < ApplicationController

  def index
    @book = Book.new
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
    @book = Book.new(book_params)
    # データがすべて入力されていたら
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 4. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    # データが入力されていなければ
    else
      @books = Book.all
      # render indexに行く前にindexにあるbooks変数に値をセットする
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    # データが入力され、アップデートされているかどうか
    # データ入力されている
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)
    # データ入力されていない
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end