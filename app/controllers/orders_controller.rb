class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]

  def index
    @order = PurchaseAddress.new
    @purchase = Purchase.exists?(item_id: @item.id)
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def new
    @order = PurchaseAddress.new
  end

  def create
    @order = PurchaseAddress.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:postnum, :prefecture_id, :city, :address, :building, :tel, :token, :item_id).merge(user_id: current_user.id)
  end
end
