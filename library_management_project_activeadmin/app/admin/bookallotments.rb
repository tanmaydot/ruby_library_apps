ActiveAdmin.register BookAllotment do
  permit_params :book_transactions_type, :admin_user_id, :book_id, :number_of_pieces
  menu parent: "Books", priority: 2
  controller do
    def create
      super do |format|
        flash_message = resource.valid? ? 'BookAllotment was successfully created.' : 'Failed to create BookAllotment.'
        flash[:notice] = flash_message
      end
    end
  end

  index do
    # selectable_column
    column :admin_user
    column :book
    column :number_of_pieces
    column :book_transactions_type
    column :created_at
    actions
  end

  filter :book_transactions_type

  form do |f|
    f.inputs do
      f.input :book_transactions_type
      f.input :admin_user, as: :select, collection: AdminUser.where.not(mem_end_date: nil).where('mem_end_date > ?', Date.today)
      f.input :book, as: :select, collection: Book.where('book_total_stock > 0').pluck(:book_title, :id)
      f.input :number_of_pieces
    end
    f.actions
  end

  action_item :view_site do
    link_to "Books", "/admin/books"
  end
end
