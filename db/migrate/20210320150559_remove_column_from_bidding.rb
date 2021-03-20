class RemoveColumnFromBidding < ActiveRecord::Migration[6.1]
  def change
    remove_column :biddings, :confirmation, :boolean
    add_reference :biddings, :auction, null: false, foreign_key: true
  end
end
