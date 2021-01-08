require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品の登録' do
    context '商品の登録ができる場合' do
      it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格の情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の登録ができない場合' do
      it '出品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態についての情報がないと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品の状態について選択されていないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it '配送料の負担情報がないと登録できない' do
        @item.ship_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship fee can't be blank")
      end
      it '配送料の負担について選択されていないと登録できない' do
        @item.ship_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship fee Select')
      end
      it '発送元の地域がないと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域が選択されてないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '発送までの日数についての情報がないと登録できない' do
        @item.ship_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end
      it '発送までの日数が選択されていないと登録できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship day Select')
      end
      it '販売価格の情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格が半角英語では登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格が半角英語混合では登録できない' do
        @item.price = 'a300'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格が¥300より低いと登録できない' do
        @item.price = Faker::Number.within(range: 0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '販売価格が¥9999999より高いと登録できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
