class Book < ApplicationRecord
  has_many :book_allotments
  belongs_to :shelf
  belongs_to :section

  def self.ransackable_attributes(auth_object = nil)
    ["book_author", "book_edition", "book_summary", "book_title", "book_total_stock", "created_at", "id", "section_id", "shelf_id", "updated_at"]
  end

  validates :book_total_stock, numericality: { greater_than_or_equal_to: 0 }
  validates :book_edition, numericality: { greater_than_or_equal_to: 0 }

  def name
    book_title
  end
end
