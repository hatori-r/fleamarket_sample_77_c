class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :buy, :destroy]

  def index
    @items = Item.all
    @items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(4)
  end
  
  def show
    @parents = Category.where(ancestry: nil)
    @categorys = Category.all
  end
  
  # 商品出品
  def new
    @item = Item.new
    @item.images.new
  end
  #親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  #子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  # 商品購入
  def buy
    @address = SendAddress.where(user_id: current_user.id)[0]
    @card_ex = Credit.where(user_id: current_user.id)
    if @card_ex.exists?
      @card= Credit.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]
      @item_buyer= Item.find(params[:id])
      @item_buyer.update(buyer_id: current_user.id)
    else
      redirect_to item_path(@item)
    end
  end
  
  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to '/'
      else
        render "new"
      end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      reder :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :introduce, :status, :shipping_fee, :shipping_area, :shipping_day, :price_introduce, :sales_status, :category_id, :brand_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end
end
