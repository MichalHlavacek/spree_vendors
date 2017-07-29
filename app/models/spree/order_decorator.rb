Spree::Order.class_eval do
  belongs_to :order, :class_name => 'Spree::Order', :optional => true
  belongs_to :vendor, :class_name => 'Spree::Vendor', :optional => true  

  has_many :suborders, :class_name => 'Spree::Order', :foreign_key => 'order_id'
  after_update :create_suborders

  def create_suborders
    self.line_items.each do |li|
      suborder = Spree::Order.where(:order => self, :vendor => li.variant.product.vendor).first_or_create do |s|
        s.order = self
        s.vendor = li.variant.product.vendor
      end
      li.update(:order => suborder)
    end
    self.update_with_updater!
    self.suborders.each {|s| s.update_with_updater!}
  end
end