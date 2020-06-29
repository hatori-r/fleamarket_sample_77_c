# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    #登録1ページ目から送られてきたパラメータを@userに代入
    @user = User.new(sign_up_params)
    #validメソッドを使ってバリデーションチェック
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
    #and returnを使って条件分岐を明示的に終了させている。
      render :new and return
    end
    #sessionにハッシュオブジェクトで情報保持させるため、attributesメソッドでデータ整形。
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user][:password] = params[:user][:password]
    #build_sned_addressメソッドはhas_one :send_addressのアソシエーションを設定すると使用可。関連付けのあるnewメソッドのようなもの
    @address = @user.build_send_address
    # @address = Send_address.new(address_params)
    render :new_address
  end

  def create_address
    #session["devise.regist_data”]の中の["user”]というハッシュの情報を@userに代入。
    @user = User.new(session["devise.regist_data"]["user"])
    @address = SendAddress.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_send_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
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

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def address_params
    params.require(:send_address).permit(:send_family_name, :send_first_name, :send_family_kana, :send_first_kana, :post_number, :prefectures, :city, :address)
  end

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
