class Spree::Vendor < Spree::Base
  has_many :products, :class_name => 'Spree::Product', :foreign_key => 'spree_vendor_id'
  has_many :spree_suborders, :class_name => 'Spree::Suborder', :foreign_key => 'vendor_id'
  has_many :managers, :class_name => 'Spree::User', :foreign_key => 'spree_vendor_id'
end
