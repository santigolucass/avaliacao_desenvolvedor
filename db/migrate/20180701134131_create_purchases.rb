class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :provider, index: true
      t.references :costumer, index: true
      t.integer :quantity
      t.string :description
      t.float :unity_price

      t.timestamps
    end
  end
end