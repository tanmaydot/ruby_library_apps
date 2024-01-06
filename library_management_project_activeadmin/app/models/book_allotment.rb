class BookAllotment < ApplicationRecord
  belongs_to :admin_user
  belongs_to :book

  after_create :update_book_count
  before_update :update_book_count_on_update
  validate :save_object?

  enum book_transactions_type: { Lost: 0, Invert_Entry: 1, Allotment: 2 }

  def self.ransackable_attributes(auth_object = nil)
    ["book_transactions_type"]
  end

  validates :number_of_pieces, numericality: { greater_than_or_equal_to: 0 }

  def update_book_count
    if book_transactions_type == "Invert_Entry"
      if book.book_total_stock >= number_of_pieces
        book.update(book_total_stock: book.book_total_stock + number_of_pieces)
      else
        errors.add(:base, "Insufficient stock to process the transaction")
        throw(:abort)
      end
    elsif book_transactions_type == "Lost" || book_transactions_type == "Allotment"
      if book.book_total_stock >= number_of_pieces
        book.update(book_total_stock: book.book_total_stock - number_of_pieces)
      else
        errors.add(:base, "Insufficient stock to process the allotment")
        throw(:abort)
      end
    end
  end

  def update_book_count_on_update
    update_book_count
  end

  private

  def save_object?
    if book.book_total_stock < 1 || number_of_pieces > book.book_total_stock
      errors.add(:base, "Book stock is not sufficient. The record was not created or updated.")
    end
  end
end
