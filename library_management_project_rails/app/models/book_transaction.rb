class BookTransaction < ApplicationRecord
  belongs_to :book
  belongs_to :user
  enum status: [:open, :close]

  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= :open
  end

  def update_book_stock
    
  end
end
