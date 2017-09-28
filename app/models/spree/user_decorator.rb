Spree.user_class.class_eval do
  belongs_to :vendor, :optional => true, :class_name => 'Spree::Vendor', :foreign_key => :spree_vendor_id
end