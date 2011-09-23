class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :title
      t.text :caption
      t.integer :gallery_id

      t.timestamps
    end
  end
end
