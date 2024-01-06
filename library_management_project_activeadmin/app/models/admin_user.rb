class AdminUser < ApplicationRecord
  has_many :book_allotments
  has_many :transactions
  enum role: ["user", "admin"]

  def self.ransackable_attributes(auth_object = nil)
    ["role"]
  end

  def list_of_active_user
       where("mem_end_date IS NOT NULL AND mem_end_date < ? ", Date.today )#.pluck(:)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


end
