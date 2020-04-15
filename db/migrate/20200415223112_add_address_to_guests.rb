class AddAddressToGuests < ActiveRecord::Migration[6.0]
  def change
    add_reference :guests, :address, null: true
  end
end
