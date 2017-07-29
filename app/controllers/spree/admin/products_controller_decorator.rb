Spree::Admin::ProductsController.class_eval do
  def collection
    return @collection if @collection.present?
    if spree_current_user.has_spree_role?('manager')
      params[:q] ||= {}
      params[:q][:deleted_at_null] ||= "1"
      params[:q][:not_discontinued] ||= "1"

      params[:q][:s] ||= "name asc"
      @collection = super
      # Don't delete params[:q][:deleted_at_null] here because it is used in view to check the
      # checkbox for 'q[deleted_at_null]'. This also messed with pagination when deleted_at_null is checked.
      if params[:q][:deleted_at_null] == '0'
        @collection = @collection.with_deleted
      end
      # @search needs to be defined as this is passed to search_form_for
      # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack products.
      # This is to include all products and not just deleted products.
      @search = @collection.ransack(params[:q].reject { |k, _v| k.to_s == 'deleted_at_null' })
      @collection = @search.result.
            distinct_by_product_ids(params[:q][:s]).
            where(:vendor => spree_current_user.vendor).
            includes(product_includes).
            page(params[:page]).
            per(params[:per_page] || Spree::Config[:admin_products_per_page])
      @collection
    else
      params[:q] ||= {}
      params[:q][:deleted_at_null] ||= "1"
      params[:q][:not_discontinued] ||= "1"

      params[:q][:s] ||= "name asc"
      @collection = super
      # Don't delete params[:q][:deleted_at_null] here because it is used in view to check the
      # checkbox for 'q[deleted_at_null]'. This also messed with pagination when deleted_at_null is checked.
      if params[:q][:deleted_at_null] == '0'
        @collection = @collection.with_deleted
      end
      # @search needs to be defined as this is passed to search_form_for
      # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack products.
      # This is to include all products and not just deleted products.
      @search = @collection.ransack(params[:q].reject { |k, _v| k.to_s == 'deleted_at_null' })
      @collection = @search.result.
            distinct_by_product_ids(params[:q][:s]).
            includes(product_includes).
            page(params[:page]).
            per(params[:per_page] || Spree::Config[:admin_products_per_page])
      @collection
    end
  end

  def new
    invoke_callbacks(:new_action, :before)
    if spree_current_user.has_spree_role?('manager')
      @product = Spree::Product.new(:vendor => spree_current_user.spree_vendor)
      respond_with(@product) do |format|
        format.html { render layout: !request.xhr? }
        if request.xhr?
          format.js   { render layout: false }
        end
      end
    else
      respond_with(@object) do |format|
        format.html { render layout: !request.xhr? }
        if request.xhr?
          format.js   { render layout: false }
        end
      end
    end
  end 
end