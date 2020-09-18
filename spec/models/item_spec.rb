require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品ができる場合' do
      it "各項目が存在すれば出品できる" do
      end
    end

    context "出品ができない場合" do
      it "画像がないと出品できない" do
      end
      it "商品名がないと出品できない" do
      end
      it "商品の説明がないと出品できない" do
      end
      it "カテゴリが--だと出品できない" do
      end
      it "商品の状態が--だと出品できない"
    end


  
end
