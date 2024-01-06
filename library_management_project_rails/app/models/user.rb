class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

  def is_validity_finished
    return false if mem_end_date.nil?
    no_of_days = (mem_end_date - Date.today())
    return no_of_days <= 1
  end

  def self.filter_user(no_of_days)
    where("mem_end_date <= ?", Date.today + no_of_days.days)
  end

  def remaining_days
    return 0 if mem_end_date.nil?
    today = Date.today
    return 0 if today >= mem_end_date
    remaining_days = (mem_end_date - today).to_i
    remaining_days
  end

end
