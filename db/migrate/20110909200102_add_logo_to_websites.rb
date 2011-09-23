class AddLogoToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :logo, :string
  end
end
