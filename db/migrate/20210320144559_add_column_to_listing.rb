class AddColumnToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :current_price, :integer
  end
end
