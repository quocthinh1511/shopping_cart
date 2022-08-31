class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shops 
      t.string :name 
      t.string :size 
      t.string :price 
      t.integer :quantity 
      t.text :description 
      t.references :categories    
      t.timestamps
    end
  end
end
