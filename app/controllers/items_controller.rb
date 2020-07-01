class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # 商品出品
  def new
    @item = Item.new
    @item.images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから親カテゴリーのみ抽出→配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end  
    #親カテゴリーが選択された後に動くアクション
    def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end
    #子カテゴリーが選択された後に動くアクション
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
    
    # @brands = Brand.all
    # @brand_array = [nil]
    # @brands.each do |brand|
    #   @beand_array << [brand.name, brand.id]
    # end
  end

  # 商品購入
  def buy

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
    @item = Item.find(params[:id])
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
    @item.destroy
    redirect_to root_path
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  #ネットで検索して見かけたdestroyに関してのヒントです。一旦消さずにおります。不要であればその際に削除します（宮前）。
  # def destroy
  #   product=Product.find(params[:id])
  #   if product.destroy
  #     redirect_to root_path, notice: '削除しました'
  #   else
  #     render :edit
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      # @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :introduce, :status, :shipping_fee, :shipping_area, :shipping_day, :price_introduce, :sales_status, :category_id, :brand_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end
end
