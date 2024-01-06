class BooksController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:search].present?
      @books = Book.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @books = Book.all
    end

  end

  def new
    @book = Book.new
  end


  def create
    @books = Book.create(book_params)
    if @books.save!
      redirect_to books_path, notice: "Book has been created successfully"
    else
      redirect_to new_book_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @section = Section.where(book_id: @book.id)
    @rak = Book.where(book_id: @book.id)
    @stock_status = @book.stock_status
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path, notice: "Book has been updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book has been successfully deleted.'
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :publication, :genres, :description, :rak_id,:section_id, :quantity, :remaining_books )
  end

end
