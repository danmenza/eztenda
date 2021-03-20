class RemoveColumnFromListing < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :current_price, :integer
  end
end
