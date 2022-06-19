require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @order_ship = FactoryBot.build(:order_ship, user_id: item.user_id, item_id: item.id)
      sleep 0.05
    end

    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_ship).to be_valid
      end

      it '建物名(address2)がなくても保存できる' do
        @order_ship.address2 = ''
        expect(@order_ship).to be_valid
      end
    end

    context '保存できない場合' do
      it 'tokenが空では登録できない' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Tokenを入力してください")
      end

      it 'postal_codeが空では登録できない' do
        @order_ship.postal_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postal codeを入力してください")
      end

      it 'prefecture_idを選んでいない（idが1）では登録できない' do
        @order_ship.prefecture_id = 1
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefectureを選んでください")
      end

      it 'cityが空では登録できない' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Cityを入力してください")
      end

      it 'address1が空では登録できない' do
        @order_ship.address1 = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Address1を入力してください")
      end

      it 'phone_numberが空では登録できない' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone numberを入力してください")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できない' do
        @order_ship.postal_code = '1234567'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postal codeにハイフン(-)を含めてください")
      end
      
      it 'phone_numberにハイフンがあると登録できない' do
        @order_ship.phone_number = '090-1234-5678'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it 'phone_numberが全角数字で記入されていると登録できない' do
        @order_ship.phone_number = '０９０１２３４５６７８'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it 'phone_numberが9桁以下しかないと登録できない' do
        @order_ship.phone_number = '080123456'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone numberは不正な値です")
      end
      
      it 'phone_numberが12桁以上あると登録できない' do
        @order_ship.phone_number = '080123456789'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it 'userが紐づいていないと登録できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐づいていないと登録できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Itemを入力してください")
      end

    end
  end
end
