class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :check
  before_action :item_user
  def index
    @order = Order.new
  end

  def create

    @order = Order.new(order_params)
     if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
  def order_params
   params.require(:order).permit(:city, :place_id, :address, :building, :phone_number, :address_number).merge(order_user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_user
    if @item.user_id == current_user.id
      redirect_to root_path 
    elsif @item.users_item
      redirect_to root_path
    end
  end

  def check
    @item = Item.find(params[:item_id])
  end

end
