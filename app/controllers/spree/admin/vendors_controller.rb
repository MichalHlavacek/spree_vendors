class Spree::Admin::VendorsController < Spree::Admin::ResourceController
  def index
    @vendors = Spree::Vendor.order('created_at DESC').page(params[:page]).per(params[:per_page] || Spree::Config[:admin_products_per_page])
  end

  def new
    @vendor = Spree::Vendor.new
  end

  def approve
    vendor = Spree::Vendor.find(params[:vendor_id])
    vendor.update(:approved_at => Time.now)
    redirect_to admin_vendors_path, :notice => "Vendor approved"
  end
end
