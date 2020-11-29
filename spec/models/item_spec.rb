require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,price,category_id,quality_id,prefecture_id,shipped_date_id,shipment_burden_id,user_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'nameが空だとうまくいかない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name cant't be blank")
      end
      it 'priceが空だとうまくいかない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price cant't be blank")
      end
      it 'category_idが空だとうまくいかない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id cant't be blank")
      end
      it 'quality_idが空だとうまくいかない' do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality_id cant't be blank")
      end
      it 'prefecture_idが空だとうまくいかない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture_id cant't be blank")
      end
      it 'shipped_date_idが空だとうまくいかない' do
        @item.shipped_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipped_date_id cant't be blank")
      end
      it 'shipment_burden_idが空だとうまくいかない' do
        @item.shipment_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment_burden_id cant't be blank")
      end
      it 'user_idが空だとうまくいかない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User_id cant't be blank")
      end
    end
  end
end
