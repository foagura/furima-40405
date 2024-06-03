class Order < ApplicationRecord
  belongs_to :buy
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
