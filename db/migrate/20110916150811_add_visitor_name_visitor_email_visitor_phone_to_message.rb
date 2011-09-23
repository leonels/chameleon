class AddVisitorNameVisitorEmailVisitorPhoneToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :visitor_name, :string
    add_column :messages, :visitor_email, :string
    add_column :messages, :visitor_phone, :string
  end
end
