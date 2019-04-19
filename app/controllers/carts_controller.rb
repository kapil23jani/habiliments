class CartsController < ApplicationController

	def index
		@items = Cart.all
	end

	def create
		@cart = Cart.create(cart_params)
	end

	def destroy
		@cart = Cart.find_by(params[:id])
		respond_to do |format|
	       format.js #-> loads /links/destroy.js.erb
      	end
	end



	private

	def cart_params
		params.require(:cart).permit(:product_id, :amount)
	end
end
