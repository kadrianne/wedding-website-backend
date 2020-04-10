class AddHouseholdRefToLogins < ActiveRecord::Migration[6.0]
  def change
    add_reference :logins, :household
  end
end
