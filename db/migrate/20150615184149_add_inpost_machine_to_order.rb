class AddInpostMachineToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_orders, :inpost_machine, :string
  end
end