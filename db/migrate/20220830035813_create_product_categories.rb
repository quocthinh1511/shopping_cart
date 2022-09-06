class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.references :product 
      t.references :categorie
      t.timestamps
    end
  end
end
