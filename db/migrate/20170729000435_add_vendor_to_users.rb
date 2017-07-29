class AddVendorToUsers < SpreeExtension::Migration[4.2]
  def change
    add_reference :spree_users, :vendor, foreign_key: { to_table: 'spree_vendors'}
  end
end