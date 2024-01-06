ActiveAdmin.register Shelf do
  permit_params :name, :section_id
  menu parent: "Books", priority: 1

  index do
    selectable_column
    column :name
    column :section
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :section
    end
    f.actions
  end

  action_item :view_site do
    link_to "Section", "/admin/sections"
  end

  action_item :view_site do
    link_to "Books", "/admin/books"
  end

end
