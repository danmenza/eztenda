class CreateBiddings < ActiveRecord::Migration[6.1]
  def change
    create_table :biddings do |t|

      t.timestamps
    end
  end
end
