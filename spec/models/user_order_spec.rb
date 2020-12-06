require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    item = FactoryBot.create(:item,user_id:user2.id)
    @userorder = FactoryBot.build(:user_order,user_id:user1.id,item_id:item.id)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'postal_code,prefecture_id,city,address,phone_numberが存在すれば購入できる' do
        expect(@userorder).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @userorder.building = nil
        expect(@userorder).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だとうまくいかない' do
        @userorder.postal_code = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが1以外だとうまくいかない' do
        @userorder.prefecture_id = 1
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Prefecture Select")
      end
      it 'prefecture_idが空だとうまくいかない' do
        @userorder.prefecture_id = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Select")
      end
      it 'cityが空だとうまくいかない' do
        @userorder.city = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だとうまくいかない' do
        @userorder.address = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だとうまくいかない' do
        @userorder.phone_number = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにはハイフンがないとうまくいかない' do
        @userorder.postal_code = '1234567'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberに数字以外があるとうまくいかない' do
        @userorder.phone_number = '090-1234-5678'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone number is invalid. Input 11 characters.")
      end
    end
  end
end