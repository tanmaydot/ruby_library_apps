class Section < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :rak, dependent: :destroy
end
