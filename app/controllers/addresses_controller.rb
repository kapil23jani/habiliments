class AddressesController < ApplicationController

	before_action :find_address, only: [:new, :create, :edit, :update, :destroy]

	def index
		@addresses = current_user.addresses.all
	end

	def new
		@address = current_user.addresses.new
	end

	def create
		@address = current_user.addresses.create(address_params)
		if @address.save
			redirect_to user_addresses_path(@address)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @address.update(address_params)
			redirect_to user_addresses_path(current_user)
		else
			render 'edit'
		end
	end

	def destroy
		if @address.destroy
			redirect_to user_addresses_path(current_user)
		else
			render 'index'
		end
	end
	
	private

	def find_address
		@address = Address.find_by_id(params[:id])
	end


	def address_params
		params.require(:address).permit(:name, :phone, :street1, :landmark, :city, :state, :country, :zipcode)
	end
		
	
end