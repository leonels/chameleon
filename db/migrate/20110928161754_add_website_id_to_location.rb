class AddWebsiteIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :website_id, :integer
  end
end
