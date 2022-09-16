class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :shop
      t.references :category
      t.string :author
      t.string :name 
      t.string :price 
      t.integer :quantity 
      t.string :description 
      t.string :image 
      t.timestamps
    end
  end
end
