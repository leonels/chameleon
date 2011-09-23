class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.string :username, :string
      t.string :first_name, :string
      t.string :last_name, :string
    
      t.string :user_state, :string
      t.string :confirmation_token, :string
      t.string :confirmed_at, :timestamp
      t.string :auth_token, :string
      t.string :password_reset_token, :string
      t.string :password_reset_sent_at, :datetime

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
