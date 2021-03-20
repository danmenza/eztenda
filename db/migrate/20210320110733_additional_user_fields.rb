class AdditionalUserFields < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :business_type, :string
    add_column :users, :location, :string
    add_column :users, :phone, :string
    add_column :users, :venue, :string
  end
end
