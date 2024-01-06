class BookTransactionsController < ApplicationController
  def index
    @book_transactions = BookTransaction.all.order(status: :asc).order(expected_date: :asc)
  end

  def new
    @book_transaction = BookTransaction.new
  end

  def create
    if is_transaction_not_valid?(params)
      redirect_to new_book_transaction_path, notice: "User is not valid or Book is not in stock"
    else
      @book_transaction = BookTransaction.create(book_transaction_params)
      if @book_transaction.save!
        book_status_open(params[:book_transaction][:book_id])

        redirect_to book_transactions_path, notice: "Book has been created successfully"
      else
        redirect_to new_book_transaction_path, notice: "Something went wrong!"
      end
    end
  end

  def edit
    @book_transaction = BookTransaction.find(params[:id])
  end

  def update
    @book_transaction = BookTransaction.find(params[:id])

    if @book_transaction.update(book_transaction_params)
      book_status_close(params[:book_transaction][:book_id])
      redirect_to book_transactions_path, notice: "Book Transaction has been updated successfully"
    else
      render :edit
    end
  end

  def show
    @book_transaction = BookTransaction.find(params[:id])
  end

  def destroy
    @book_transaction = BookTransaction.find(params[:id])
    @book_transaction.destroy
    redirect_to book_transactions_path, notice: 'Transaction has been successfully deleted.'
  end

  private

  def book_transaction_params
    params.require(:book_transaction).permit(:user_id, :book_id, :status, :expected_date)
  end

  def is_transaction_not_valid?(params)
    user = User.find(params[:book_transaction][:user_id])
    book = Book.find(params[:book_transaction][:book_id])

    user.is_validity_finished  || book.remaining_books < 1
  end


  def book_status_open(book_id)
    book = Book.find(book_id)
    book.update(remaining_books: book.try(:remaining_books).try(:pred) )
  end
  def book_status_close(book_id)
    book = Book.find(book_id)
    book.update(remaining_books: book.try(:remaining_books).try(:next) )
  end
end
