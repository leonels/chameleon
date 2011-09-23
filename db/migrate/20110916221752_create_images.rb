class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :alt
      t.string :src
      t.integer :website_id
      t.integer :page_id

      t.timestamps
    end
  end
end
