class Spree::Vendor < Spree::Base
  has_many :products, :class_name => 'Spree::Product', :foreign_key => 'spree_vendor_id'
  has_many :spree_suborders, :class_name => 'Spree::Suborder', :foreign_key => 'vendor_id'
  has_many :employees, :class_name => Spree.user_class, :foreign_key => 'spree_vendor_id'

  def manager
    self.employees.first
  end
end
