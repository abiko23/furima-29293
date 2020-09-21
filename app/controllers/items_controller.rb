class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :state_id, :fee_id, :province_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
