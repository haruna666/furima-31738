require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'postal_code,prefecture_id,city,address,phone_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order.building = nil
        expect(@user_donation).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だとうまくいかない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが1以外だとうまくいかない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture id Select")
      end
      it 'prefecture_idが空だとうまくいかない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture id can't be blank")
      end
      it 'cityが空だとうまくいかない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だとうまくいかない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だとうまくいかない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにはハイフンがないとうまくいかない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code invalid. Include hyphen(-)")
      end
      it 'phone_numberに数字以外があるとうまくいかない' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number invalid.")
      end
    end
  end
end