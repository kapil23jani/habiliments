class CreateSellerprofiles < ActiveRecord::Migration[5.2]
  def change
    create_table :sellerprofiles do |t|
    	t.string :name
    	t.string :street1
    	t.string :landmark
    	t.string :city
    	t.string :state
    	t.string :country
    	t.integer :zipcode
    	t.string :trade_licence
    	t.string :gst_no
    	t.string :sales_tax
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
