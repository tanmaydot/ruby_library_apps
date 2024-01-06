ActiveAdmin.register Transaction do
  permit_params :admin_user_id, :mem_plan_id
  menu parent: "Admin Users", priority: 1

  index do
    selectable_column
    column :admin_user
    column :mem_plan_name
    actions
  end

  filter :admin_user

  form do |f|
    f.inputs do
      f.input :admin_user, as: :select, collection: AdminUser.where(role: "user")
      f.input :mem_plan_id, as: :select, collection: MembershipPlan.where(active: "yes").pluck(:plan_name, :id)
    end
    f.actions
  end

  action_item :view_site do
    link_to "Membership Plan", "/admin/membership_plans"
  end

end
