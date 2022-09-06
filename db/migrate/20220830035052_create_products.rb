class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shops 
      t.string :author
      t.string :name 
      t.string :price 
      t.integer :quantity 
      t.text :description 
      t.text :image 
         
      t.timestamps
    end
  end
end
