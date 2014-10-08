Deface::Override.new(
  :virtual_path => "spree/admin/product_properties/index",
  :name => "multi_domain_admin_product_properties_store_hidden_field",
  :insert_after => "[data-hook='add_product_properties']",
  :partial => "spree/admin/product_properties/stores_hidden_fields",
  :disabled => false)
