class AddLayoutToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :layout_name, :string
    add_column :websites, :custom_layout_content, :text
  end
end
