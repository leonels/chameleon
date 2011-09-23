class AddPageIdToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :page_id, :integer
  end
end
