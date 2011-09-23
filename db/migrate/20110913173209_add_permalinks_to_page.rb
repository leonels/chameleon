class AddPermalinksToPage < ActiveRecord::Migration
  def change
    add_column :pages, :permalink, :string
  end
end
