require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @order = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    it 'すべての値が正しく入力されていれば保存できること' do
    end
  end
end
