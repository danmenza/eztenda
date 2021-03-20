class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|

      t.timestamps
    end
  end
end
