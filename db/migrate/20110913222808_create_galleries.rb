class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :description
      t.integer :website_id

      t.timestamps
    end
  end
end
