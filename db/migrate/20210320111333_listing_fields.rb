class ListingFields < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :quantity, :integer
    add_column :listings, :drink_category, :string
    add_column :listings, :start_date, :date
    add_column :listings, :end_date, :date
    add_column :listings, :description, :string
    add_column :listings, :min_price, :float
    add_column :listings, :wholesaler, :string
    add_column :listings, :marketing, :boolean
  end
end
