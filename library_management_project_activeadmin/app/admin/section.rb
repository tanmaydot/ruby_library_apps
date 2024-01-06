ActiveAdmin.register Section do
  permit_params :name
  menu parent: "Books", priority: 0

  index do
    selectable_column
    column :name
    column "Shelf" do |section|
      section.shelves
    end
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  action_item :view_site do
    link_to "Shelves", "/admin/shelves"
  end

  action_item :view_site do
    link_to "Books", "/admin/books"
  end
end
