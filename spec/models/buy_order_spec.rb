require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_order = FactoryBot.build(:buy_order, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の登録' do
    context '配送先情報が登録できる場合' do
      it 'すべての値が正しく入力されている場合' do
        expect(@buy_order).to be_valid
      end
      it '建物名が空でも登録できる' do
        @buy_order.building_name = ''
        expect(@buy_order).to be_valid
      end
    end

    context '配送先情報が登録できない場合' do
      it 'user_idが紐づいてないと登録できない' do
        @buy_order.user_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいてないと登録できない' do
        @buy_order.item_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @buy_order.postal_code = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列以外だと登録できない' do
        @buy_order.postal_code = '1234567'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Postal code [000-0000]のように半角で入力してください')
      end
      it 'prefecture_idが空だと登録できない' do
        @buy_order.prefecture_id = 1
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと登録できない' do
        @buy_order.municipalities = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと登録できない' do
        @buy_order.address = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @buy_order.phone_number = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では登録できない' do
        @buy_order.phone_number = 123_456_789
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Phone number 10~11桁の半角数字で入力してください')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @buy_order.phone_number = 123_456_789_012
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Phone number 10~11桁の半角数字で入力してください')
      end
      it 'phone_numberに半角数字以外が含まれている場合、登録できない' do
        @buy_order.phone_number = '000-0000-0000'
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include('Phone number 10~11桁の半角数字で入力してください')
      end
      it 'tokenが空だと登録できない' do
        @buy_order.token = ''
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
