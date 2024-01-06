class Rak < ApplicationRecord
  has_many :books
  belongs_to :section
end
