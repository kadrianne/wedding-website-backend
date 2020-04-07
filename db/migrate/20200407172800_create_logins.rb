class CreateLogins < ActiveRecord::Migration[6.0]
  def change
    create_table :logins do |t|
      t.string :login_name
      t.string :password_digest

      t.timestamps
    end
  end
end
