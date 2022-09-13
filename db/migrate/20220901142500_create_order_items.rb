class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
            t.references :product
            t.references :order
            t.integer :quantity 
            t.integer :total
            t.timestamps
    end
  end
end
