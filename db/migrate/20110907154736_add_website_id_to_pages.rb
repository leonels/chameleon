class AddWebsiteIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :website_id, :integer
  end
end
