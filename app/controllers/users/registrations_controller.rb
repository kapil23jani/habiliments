class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, :only => [ :new, :create, :cancel ]
  # GET /resource/sign_up
  def new
    @user = User.new
    @profile = @user.build_sellerprofile
  end

  # POST /resource
  def create
    @user = User.create(seller_params)
    if @user.save
      redirect_to welcomes_path(@user)
    else
      render 'new'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  private

  def seller_params
    params.require(:user).permit(:email, :role, sellerprofile_attributes: [:name, :contact_no, :phone_no, :fax_no, :street1, :city, :state, :country, :zipcode, :trade_licence, :gst_no, :sales_tax])
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
