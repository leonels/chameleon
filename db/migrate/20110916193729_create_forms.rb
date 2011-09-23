class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :heading
      t.text :description
      t.integer :page_id
      t.integer :website_id

      t.timestamps
    end
  end
end
