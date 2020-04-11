class ChangeAgeColumnInGuests < ActiveRecord::Migration[6.0]
  def change
    change_column :guests, :age, :string
  end
end
