class ListingAssocations < ActiveRecord::Migration[6.1]
  def change
    add_reference :biddings, :listing, null: false, foreign_key: true
  end
end
