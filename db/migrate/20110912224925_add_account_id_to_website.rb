class AddAccountIdToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :account_id, :integer
  end
end
