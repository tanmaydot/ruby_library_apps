class MembershipPlan < ApplicationRecord
  has_many :transactions
  enum active: { no: 0, yes: 1 }

  validates :plan_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :total_days, numericality: { greater_than_or_equal_to: 0 }


  def self.ransackable_attributes(auth_object = nil)
    ["active"]
  end

end
