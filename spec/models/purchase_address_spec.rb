require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @order = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end

    it '建物名が空でも保存できる' do
      @order.building = ''
      expect(@order).to be_valid
    end

    it 'トークンが空だと保存できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと保存できない' do
      @order.postnum = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postnum can't be blank")
    end

    it '郵便番号の桁が正しくないと保存できない' do
      @order.postnum = '12-3456'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postnum is invalid. Include hyphen(-)')
    end

    it '郵便番号に-がないと保存できない' do
      @order.postnum = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postnum is invalid. Include hyphen(-)')
    end

    it '都道府県が-だと保存できない' do
      @order.prefecture_id = '0'
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空だと保存できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できない' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空だと保存できない' do
      @order.tel = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel can't be blank")
    end
  end
end
