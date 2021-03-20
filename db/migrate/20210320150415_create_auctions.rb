class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.float :current_price
      t.boolean :confirmation, null: false, default: false
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
