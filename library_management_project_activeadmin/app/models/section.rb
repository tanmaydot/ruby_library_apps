class Section < ApplicationRecord
  has_many :shelves

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
  
end
