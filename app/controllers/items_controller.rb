class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new

    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @province = Prefecture.find(@item.province_id)
    @day = Day.find(@item.days_id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :state_id, :fee_id, :province_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
