class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :product_name
    	t.string :brand_name
    	t.string :material
    	t.string :description
    	t.string :colour 
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
