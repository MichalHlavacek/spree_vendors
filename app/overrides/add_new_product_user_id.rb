Deface::Override.new(virtual_path: 'spree/admin/products/new',
  name: 'add_new_product_user_id',
  insert_top: "[data-hook='new_product']",
  text: '<% if spree_current_user.has_spree_role?("manager") %><%= f.hidden_field :vendor_id %><% else %><%= f.label :vendor_id, "Vendor ID" %><%= f.text_field :vendor_id, :class => "form-control" %><% end %>')
