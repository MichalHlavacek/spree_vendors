class CreateSpreeVendors < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_vendors do |t|
      t.string :name
      t.string :business_type
      t.string :phone
      t.string :web
      t.string :address
      t.string :ein
      t.timestamp :approved_at
      t.decimal :commission, precision: 5, scale: 4

      t.timestamps
    end
  end
end
