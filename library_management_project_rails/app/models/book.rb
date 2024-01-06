class Book < ApplicationRecord
  belongs_to :rak
  belongs_to :section

  def stock_status
    if remaining_books <= 0
      "Out of Stock"
    else
      "Available"
    end
  end

end
