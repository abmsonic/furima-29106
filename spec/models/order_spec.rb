require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報と配送先の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.save
      sleep 1
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @order.building = nil
      expect(@order).to be_valid
    end
    it 'postal_codeが空では保存できないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンが入っていなければ保存できないこと' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'postal_codeに半角英字が入っていると保存できないこと' do
      @order.postal_code = '123-456a'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'prefecture_idが空だと保存できないこと' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture Select')
    end
    it 'prefecture_idが選択されていないと保存できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture Select')
    end
    it 'cityが空だと保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字では保存できないこと' do
      @order.phone_number = '１２３４５６７８９０１'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberが半角英字では保存できないこと' do
      @order.phone_number = 'aaaaaaaaaaa'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberは12桁以上では保存できないこと' do
      @order.phone_number = 123_456_789_012
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number Input only number')
    end
    it 'user_idが空だと保存できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
