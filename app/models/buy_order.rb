class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,
                :municipalities, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\Z/, message: '[000-0000]のように半角で入力してください' }
    validates :municipalities, :address
    validates :phone_number, format: { with: /\A\d{10,11}\Z/, message: '10~11桁の半角数字で入力してください' }
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id:, item_id:)
    Order.create(postal_code:, prefecture_id:, municipalities:,
                 address:, building_name:, phone_number:, buy_id: buy.id)
  end
end
