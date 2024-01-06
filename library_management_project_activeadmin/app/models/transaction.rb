class Transaction < ApplicationRecord
  belongs_to :admin_user, foreign_key: 'admin_user_id', class_name: 'AdminUser'
  belongs_to :membership_plan, foreign_key: 'mem_plan_id', class_name: 'MembershipPlan'

  after_create :update_the_admin_user
  after_update :update_the_admin_user_on_update

  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "mem_plan_id"]
  end

  def update_the_admin_user
    if admin_user.mem_start_date.nil? || admin_user.mem_start_date.blank?
      admin_user.update(
        mem_start_date:  Date.today,
        mem_end_date: Date.today + membership_plan.total_days,
        total_amount_paid: membership_plan.plan_amount
      )
    else
      admin_user.update(
        mem_end_date: Date.today + membership_plan.total_days,
        total_amount_paid: admin_user.total_amount_paid + membership_plan.plan_amount
      )
    end
  end

  def update_the_admin_user_on_update
    if admin_user.mem_start_date.nil? || admin_user.mem_start_date.blank?
      admin_user.update(
        mem_start_date:  Date.today,
        mem_end_date: Date.today + membership_plan.total_days,
        total_amount_paid: membership_plan.plan_amount
      )
    else
      admin_user.update(
        mem_end_date: Date.today + membership_plan.total_days,
        total_amount_paid: admin_user.total_amount_paid + membership_plan.plan_amount
      )
    end
  end

  def mem_plan_name
    membership_plan&.plan_name
  end
end
