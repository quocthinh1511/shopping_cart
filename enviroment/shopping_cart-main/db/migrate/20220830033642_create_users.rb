class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email 
      t.string :password 
      t.string :phone
      t.string :address 
      t.string :avatar , default: 'https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg'
      t.integer :role, default: 0 
      t.timestamps
    end
  end
end
