ActiveAdmin.register_page 'Dashboard' do
  menu priority: 0, label: proc { I18n.t("active_admin.dashboard") }
  content title: 'Dashboard' do
    panel 'Quick Access' do
      ul do
        li link_to 'Admin Users', admin_admin_users_path
        li link_to 'Books', admin_books_path
        li link_to 'Section', admin_sections_path
        li link_to 'Shelf', admin_shelves_path
        li link_to 'Book Allotments', admin_book_allotments_path
        li link_to 'Membership Plans', admin_membership_plans_path
        li link_to 'Transaction', admin_transactions_path
      end
    end
    panel 'Data' do
      ul do
      li h2 "Total Users: #{AdminUser.count}"
      li h2 "Total Books: #{Book.count}"
      li h2 "Total Allotment: #{BookAllotment.count}"
      li h2 "Total Transactions: #{Transaction.count}"
      end
    end
  end
end
