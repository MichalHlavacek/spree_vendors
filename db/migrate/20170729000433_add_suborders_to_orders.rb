class AddSubordersToOrders < SpreeExtension::Migration[4.2]
  def change
    add_reference :spree_orders, :vendor, foreign_key: { to_table: 'spree_vendors'}
    add_reference :spree_orders, :order, foreign_key: { to_table: 'spree_orders'}
  end
end