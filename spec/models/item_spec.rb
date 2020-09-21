require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品ができる場合' do
      it '各項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリが--だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が--だと出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it '配送料の負担が--だと出品できない' do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end
      it '発送元の地域が--だと出品できない' do
        @item.province_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Province must be other than 0')
      end
      it '発送までの日数が--だと出品できない' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end
      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満だと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は300円以上9,999,999円以下で入力してください')
      end
      it '価格が10M以上だと出品できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は300円以上9,999,999円以下で入力してください')
      end
    end
  end
end
