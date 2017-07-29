Deface::Override.new(virtual_path: 'spree/layouts/admin',
  name: 'add_vendors_to_admin_layout',
  insert_bottom: "div#main-sidebar",
  text: '
  <% if spree_current_user.has_spree_role?("admin") %>
<ul class="nav nav-sidebar">
  <li class="sidebar-menu-item">
    <a data-toggle="collapse" data-parent="#sidebar" href="#sidebar-vendors">
      <span class="icon icon-briefcase"></span>
      <span class="text"> Vendors</span>
      <span class="icon icon-chevron-left pull-right"></span>
    </a>
    <ul id="sidebar-vendors" class="collapse nav nav-pills nav-stacked" data-hook="admin_vendors_sub_tabs">
      <li class="sidebar-menu-item"><a href="/admin/vendors">Vendors</a></li>
      <li class="sidebar-menu-item"><a href="/admin/payments">Payments</a></li>
    </ul>
  </li>
</ul><% end %>')
