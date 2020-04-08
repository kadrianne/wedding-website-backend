class RemoveAddressFromGuest < ActiveRecord::Migration[6.0]
  def change
    remove_column :guests, :address_id
  end
end
