require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'postal_code,prefecture_id,city,address,phone_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だとうまくいかない' do
        @order.postal_coad = nil
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
          @order.prefecture_id = 1234567
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code into '-' ")
        end
      end
      it 'phone_numberに数字以外があるとうまくいかない' do
        
      end
    end
  end
  end
end
