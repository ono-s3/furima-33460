class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_buy, only: [:index, :create]

  def index
    if @item.buy != nil || current_user.id == @item.user.id
      redirect_to root_path
    end
    @buy_shipping = BuyShipping.new
  end


  def create
    @buy_shipping = BuyShipping.new(buy_shipping_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_buy
    @item = Item.find(params[:item_id])
    
  end

  def buy_shipping_params
    params.require(:buy_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number,:token).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_shipping_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end





end
