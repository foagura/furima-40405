class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id,
     :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(:user, current_user.id)
  end
end
