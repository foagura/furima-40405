class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :order_confirmation, only: :index
  before_action :user_confirmation, only: :index


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_order = BuyOrder.new
  end

  def create
    buy_order = BuyOrder.new(order_params)
    if buy_order.valid?
      pay_item
      buy_order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:buy_order).permit(:postal_code, :prefecture_id, :municipalities,
                                  :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :card => order_params[:token],
      :currency => 'jpy',
    )
  end

  def order_confirmation
    item = Item.find(params[:item_id])
    if item.buy.present?
      redirect_to root_path
    end
  end

  def user_confirmation
    item = Item.find(params[:item_id])
    if item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
