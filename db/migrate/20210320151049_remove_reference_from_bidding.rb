class RemoveReferenceFromBidding < ActiveRecord::Migration[6.1]
  def change
    remove_reference :biddings, :listing, foreign_key: true
  end
end
