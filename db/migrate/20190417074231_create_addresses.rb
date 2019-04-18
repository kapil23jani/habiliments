class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.string :name
    	t.string :phone
    	t.string :street1
    	t.string :landmark
    	t.string :city
    	t.string :state
    	t.string :country
    	t.integer :zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
