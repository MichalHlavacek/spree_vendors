class Spree::Admin::VendorsController < Spree::Admin::ResourceController
  def index
    @vendors = Spree::Vendor.page(params[:page]).per(params[:per_page] || Spree::Config[:admin_products_per_page])
  end

  def new
    @vendor = Spree::Vendor.new
  end
end
