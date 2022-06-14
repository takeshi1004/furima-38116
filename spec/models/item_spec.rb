require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '必要な項目をすべて入力していれば、出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end

      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'category_idが選択されていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品のカテゴリーを選んでください")
      end

      it 'status_idが選択されていないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選んでください")
      end

      it 'ship_cahrge_idが選択されていないと出品できない' do
        @item.ship_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選んでください")
      end

      it 'prefecture_idが選択されていないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選んでください")
      end

      it 'take_days_idが選択されていないと出品できない' do
        @item.take_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選んでください")
      end

      it 'total_priceが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'total_priceが全角数字では出品できない' do
        @item.total_price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は半角数字で入力してください")
      end

      it 'total_priceが整数以外では出品できない' do
        @item.total_price = 3000.5
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は整数で入力してください")
      end

      it 'total_priceが300より小さいと出品できない' do
        @item.total_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300円以上に設定してください")
      end

      it 'total_priceが9,999,999より大きいと出品できない' do
        @item.total_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999円以下に設定してください")
      end
    end
  end
end
