class AddVendorToProducts < SpreeExtension::Migration[4.2]
  def change
    add_reference :spree_products, :vendor, foreign_key: {to_table: 'spree_vendors'}
  end
end
