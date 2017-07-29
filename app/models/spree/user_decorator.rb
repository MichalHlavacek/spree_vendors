Spree::User.class_eval do
  belongs_to :vendor, :optional => true, :class_name => 'Spree::Vendor'
end