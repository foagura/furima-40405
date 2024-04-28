class User < ApplicationRecord
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\Z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください'} do
    validates :last_name, :first_name
  end

  with_options presence: true, format: { with: /\A[ァ‐ヶ]+\Z/, message: '全角（カタカナ）を使用してください'} do
    validates :last_name_kana, :first_name_kana
  end

  validates :birth_date, presence: true, format: { with: /\A[\d]{8,8}\Z/, message: '数字のみ使用して、例:20240101のように入力してください'}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
