class AddColumnToSellerprofile < ActiveRecord::Migration[5.2]
  def change
  	add_column :sellerprofiles, :phone_no, :string
  	add_column :sellerprofiles, :contact_no, :string
  	add_column :sellerprofiles, :fax_no, :string

  end
end
