class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postnum, :prefecture_id, :city, :address, :building, :tel, :token, :item_id,  :user_id

  with_options presence: true do
    validates :postnum, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :postnum, :prefecture_id, :city, :address, :tel, :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    #user = User.find(params[:id])
    #item = Item.find(params[:id])
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, postnum: postnum, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel)
  end

end