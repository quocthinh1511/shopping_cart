class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
  
            t.references :products 
            t.references :orders 
            t.integer :quantity 
            t.integer :price 
            t.timestamps
    end
  end
end
