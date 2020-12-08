require 'rails_helper'
describe Item do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @items = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,price,category_id,quality_id,prefecture_id,shipped_date_id,shipment_burden_id,user_id,imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'nameが空だとうまくいかない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'priceが空だとうまくいかない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが10000000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'category_idが１以外でないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'category_idが空だとうまくいかない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'quality_idが１以外でないと登録できない' do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality Select')
      end
      it 'quality_idが空だとうまくいかない' do
        @item.quality_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'prefecture_idが１以外でないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'prefecure_idが空だとうまくいかない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipped_date_idが１以外でないと登録できない' do
        @item.shipped_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipped date Select')
      end
      it 'shiooed_date_idが空だとうまくいかない' do
        @item.shipped_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipped date can't be blank")
      end
      it 'shipment_burden_idが１以外でないと登録できない' do
        @item.shipment_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment burden Select')
      end
      it 'shipmident_burden_idが空だとうまくいかない' do
        @item.shipment_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment burden can't be blank")
      end
      it 'user_idが空だとうまくいかない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
