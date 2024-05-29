class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  with_options presence: true do
    validates :name, :content, :image
  end

  validates :price, presence: true, numericality: { in: 300..9_999_999, only_integer: true }

  with_options numericality: { other_than: 1, message: "can't bo blank" } do
    validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end
