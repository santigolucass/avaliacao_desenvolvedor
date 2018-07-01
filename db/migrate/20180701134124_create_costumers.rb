class CreateCostumers < ActiveRecord::Migration
  def change
    create_table :costumers do |t|
      t.string :name

      t.timestamps
    end
  end
end