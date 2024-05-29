class User < ApplicationRecord
  has_many :items
  has_many :buys

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\Z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角で英語と数字を両方含めてください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\Z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :last_name, :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\Z/, message: '全角（カタカナ）を使用してください' } do
    validates :last_name_kana, :first_name_kana
  end

  validates :birth_date, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
