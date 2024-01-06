ActiveAdmin.register MembershipPlan do
  permit_params :plan_amount, :active, :total_days, :plan_name
  menu parent: "Admin Users", priority: 0

  index do
    selectable_column
    column :plan_name
    column :plan_amount
    column :total_days
    column :active
    actions
  end

  filter :active

  form do |f|
    f.inputs do
      f.input :plan_name
      f.input :plan_amount
      f.input :total_days
      f.input :active
    end
    f.actions
  end

  action_item :view_site do
    link_to "Transaction", "/admin/transactions"
  end

end
