ActiveAdmin.register AdminUser do
  permit_params :username, :email, :role, :password
  menu priority: 1

  index do
    selectable_column
    column :username
    column :email
    column :created_at
    column :role
    column :mem_end_date
    column :total_amount_paid
    column "Membership Plan" do |admin_user|
      latest_transaction = Transaction.where(admin_user_id: admin_user.id).last
      if latest_transaction
        membership_plan = latest_transaction.membership_plan
        if membership_plan
          link_text = "#{membership_plan.plan_name} - ₹#{membership_plan.plan_amount}"
          link = link_to 'Membership', admin_membership_plan_path(membership_plan)
          "#{link_text} #{link}".html_safe
        else
          'No Membership Plan'
        end
      else
        'No Transaction'
      end
    end
    actions
  end

  filter :role

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :role
      f.input :password
    end
    f.actions
  end
end
