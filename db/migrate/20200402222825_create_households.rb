class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.string :family
      t.string :region

      t.timestamps
    end
  end
end
