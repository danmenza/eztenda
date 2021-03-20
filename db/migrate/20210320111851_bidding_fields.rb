class BiddingFields < ActiveRecord::Migration[6.1]
  def change
    add_column :biddings, :price, :integer
    add_column :biddings, :incentive, :text
    add_column :biddings, :confirmation, :boolean
  end
end
