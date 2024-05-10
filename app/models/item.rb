class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :content, :price, :image, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end
