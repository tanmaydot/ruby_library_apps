ActiveAdmin.register Book do
  permit_params :book_title, :book_author, :book_summary, :book_edition, :book_total_stock, :section_id, :shelf_id
  menu priority: 2

  index do
    selectable_column
    column :book_title
    column :book_author
    column :book_summary
    column :book_edition
    column :book_total_stock
    column :section
    column :shelf
    actions
  end

  filter :book_title

  form do |f|
    panel "Book" do
      div class: "panel_contents" do
        raw <<-HTML
          <script>
            document.addEventListener("DOMContentLoaded", function () {
              const sectionSelect = document.getElementById("book_section_id"); // Correct ID
              const shelfSelect = document.getElementById("book_shelf_id"); // Correct ID

              function updateShelfOptions() {
                const selectedSectionId = sectionSelect.value;
                $.ajax({
                  url: `http://127.0.0.1:3000/api/shelf/${selectedSectionId}`,
                  method: "GET",
                  dataType: "json",
                  success: function (data) {
                    // Clear and populate the shelfSelect options
                    shelfSelect.innerHTML = "";
                    data.forEach(shelf => {
                      const option = document.createElement("option");
                      option.value = shelf[1]; // Correctly access shelf.id
                      option.text = shelf[0];  // Correctly access shelf.name
                      shelfSelect.appendChild(option);
                    });
                  },
                  error: function (xhr, status, error) {
                    // Handle any errors that occur during the AJAX request
                    console.error("Error: " + error);
                  }
                });
              }
              sectionSelect.addEventListener("change", updateShelfOptions);
            });
          </script>
        HTML
      end
      f.inputs do
        f.input :book_title
        f.input :book_author
        f.input :book_summary
        f.input :book_edition
        f.input :book_total_stock
        f.input :section
        f.input :shelf
      end
      f.actions
    end
  end



  action_item :view_site do
    link_to "Book Allotment", "/admin/book_allotments"
  end
end
