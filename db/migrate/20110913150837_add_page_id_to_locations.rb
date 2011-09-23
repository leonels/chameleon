class AddPageIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :page_id, :integer
  end
end
