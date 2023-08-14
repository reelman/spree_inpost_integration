class AddInpostSizeToSpreeProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_products, :inpost_size, :string
  end
end
