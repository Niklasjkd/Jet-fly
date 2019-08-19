class CreatePlanes < ActiveRecord::Migration[5.2]
  def change
    create_table :planes do |t|
      t.references :user, foreign_key: true
      t.integer :price_per_min
      t.integer :base_price
      t.string :type
      t.string :location
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
