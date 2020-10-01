class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = PurchaseAddress.new
    @purchase = Purchase.exists?(item_id: @item.id)
    redirect_to root_path if @purchase
  end

  def new
    @order = PurchaseAddress.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    # @order = Order.new(order_params)
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
    Payjp.api_key = 'sk_test_951d6ecb774b61127114bed7' # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def purchase_params
    params.permit(:postnum, :prefecture_id, :city, :address, :building, :tel, :token, :item_id).merge(user_id: current_user.id)
  end
end
