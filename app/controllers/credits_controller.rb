# 担当：アドリアン　コメントアウトに関しましては、まだ実装完了していないのでそのままにさせていただきました。最後に不要な部分は削除いたしますのでよろしくお願いします。

class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]
  require "payjp"
  # GET /credits
  # GET /credits.json
  def index
    
    @credits = Credit.get_card(current_user.credit.customer_id) if current_user.credit
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
    # ログイン中のユーザーのクレジットカード登録の有無を判断
    @card = Credit.find_by(user_id: current_user.id)
    if @card.blank?
      # 未登録なら新規登録画面に
      redirect_to action: "new" 
    else
      # これを変更しない限りエラーが起きる[:PAYJP_SECRET_KEY]
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # カスタマー情報からカードの情報を引き出す
      @customer_card = customer.cards.retrieve(@card.card_id)

      ##カードのアイコン表示のための定義づけ
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "mastercard.png"
      when "American Express"
        @card_src = "americanExpress.png"
      when "Diners Club"
        @card_src = "dinersClub.png"
      when "Discover"
        @card_src = "discover.png"
      end

      ## 有効期限'月'を定義
      @exp_month = @customer_card.exp_month.to_s
      ## 有効期限'年'を定義
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  # GET /credits/new
  def new
    # @card = CreditCard.where(user_id: current_user.id)
    # redirect_to credit_card_path(current_user.id) if @card.exists?
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits
  # POST /credits.json
def create #payjpとCardのデータベース作成これを変更しない限りエラーが起きる[:PAYJP_SECRET_KEY]
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    #保管した顧客IDでpayjpから情報取得
    if params['payjp-token'].blank?
      redirect_to new_credit_path
    else
    
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      ) 
      @card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
     
      if @card.save
        redirect_to credits_path(current_user.id)
      else
        new_credit_path
      end
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        format.html { redirect_to @credit, notice: 'Credit was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit }
      else
        format.html { render :edit }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    # ログイン中のユーザーのクレジットカード登録の有無を判断
    @card = Credit.find_by(user_id: current_user.id)
    if @card.blank?
      # 未登録なら新規登録画面に
      redirect_to action: "new"
    else
      # 前前回credentials.yml.encに記載したAPI秘密鍵を呼び出します。
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # そのカスタマー情報を消す
      customer.delete
      @card.delete
      # 削除が完了しているか判断
      if @card.destroy
      # 削除完了していればdestroyのビューに移行
      # destroyビューを作るのが面倒であれば、flashメッセージを入れてトップページやマイページに飛ばしてもOK
        
      else
        redirect_to users_show_path(current_user.id)
        # 削除されなかった場合flashメッセージを表示させて、showのビューに移行
     
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credit_params
      params.require(:credit).permit(:card_number, :expiration_year, :expiration_month, :security_code, :user_id)
    end
end
