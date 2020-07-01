class HomeController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @parents = Category.where(ancestry: nil)
  end

  def show
    @item = Item.find(params[:id])
  end
end
