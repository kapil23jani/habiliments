class SellerprofilesController < ApplicationController

  before_action :find_sellerprofile, only: [:create, :edit, :update, :delete]

  def index
    @profile = current_user.build_sellerprofile if current_user.sellerprofile.nil?
  end

  def new 
    #binding.pry
    @profile = current_user.build_sellerprofile
  end

  def create
    @profile = current_user.build_sellerprofile(seller_params)
    if @profile.save
      redirect_to user_sellerprofiles_path(current_user, @profile)
    else
      render 'new'
    end
  end

  def edit
  end


  def show
  end

  def update
    if @profile.update(seller_params)
      redirect_to user_sellerprofiles_path(current_user, @profile)
    else
      render "edit"
    end
  end



  private

  def find_sellerprofile
    @profile = Sellerprofile.find_by_id(params[:id])
  end

  def seller_params
    params.require(:sellerprofile).permit(:name, :contact_no, :phone_no, :fax_no, :street1, :city, :state, :country, :zipcode, :trade_licence, :gst_no, :sales_tax)
  end
end
