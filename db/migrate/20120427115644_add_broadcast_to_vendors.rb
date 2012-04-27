class AddBroadcastToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :broadcast, :text
  end
end
