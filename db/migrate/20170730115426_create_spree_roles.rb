class CreateSpreeRoles < SpreeExtension::Migration[4.2]
  def up
    Spree::Role.create(:name => 'manager')
    Spree::Role.create(:name => 'employee')
  end

  def down
    Spree::Role.find_by_name('manager').destroy
    Spree::Role.find_by_name('employee').destroy
  end
end
