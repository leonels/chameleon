class AddWebsiteIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :website_id, :integer
  end
end
