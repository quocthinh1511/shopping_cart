class CreateOders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :order_items
      t.references :users 
      t.integer :sum
      t.timestamps
    end
  end
end
