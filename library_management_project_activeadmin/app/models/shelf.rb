class Shelf < ApplicationRecord
  belongs_to :section
  has_many :books

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

end
