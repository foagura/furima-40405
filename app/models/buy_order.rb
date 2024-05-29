class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, 
                :municipalities, :address, :building_name, :phone_number, :token

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\Z/, message: '[000-0000]のように半角で入力してください' }

  with_options presence: true do
    validates :prefecture_id, :municipalities, :address
  end

  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\Z/, message: '10~11桁の半角数字で入力してください'}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, 
                 address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id, token: token)
  end
end