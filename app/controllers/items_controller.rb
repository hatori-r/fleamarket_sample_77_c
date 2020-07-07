class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :buy, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(4)
  end
  
  # GET /items/1.json
  def show
    @parents = Category.where(ancestry: nil)
    @categorys = Category.all
  end
  
  # 商品出品
  def new
    @item = Item.new
    @item.images.new
    
    # -----↓メモ↓-----
    # @category_parent_array = Category.get_parent_category
    # -----↑メモ↑-----
    
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
  end
  
  # ＃商品詳細（仮）
  # def item_details
  
  # end
  
  #商品編集(仮)
  def change
    
  end
  
  #商品削除（仮）
  def cut
    
  end
  
  # GET /items/1/edit
  def edit
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    
    # -----↓メモ↓-----
    # @category_parent_array = Category.get_parent_category
    # -----↑メモ↑-----
    
    @category_children_array = Category.where(ancestry: child_category.ancestry)
    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)
  end
  
  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to '/'
      else
        render "new"
      end

    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      reder :edit
    end
    # respond_to do |format|
    #   if @item.update(item_params)
    #     format.html { redirect_to @item, notice: 'Item was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @item }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :introduce, :status, :shipping_fee, :shipping_area, :shipping_day, :price_introduce, :sales_status, :category_id, :brand_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end
end
