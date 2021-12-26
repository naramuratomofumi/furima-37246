require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    sleep 1
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it 'すべての内容が正しく入力されていれば保存ができること' do
        expect(@order_address).to be_valid
      end
      it 'building_numは空でも保存できること' do
        @order_address.building_num = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'post_codeが空だと登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'prefectures_idが"---"(1)だと登録できない' do
        @order_address.prefectures_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefectures can't be blank"
      end
      it 'municipalitiesが空だと登録できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'addressが空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'telephone_numが空だと登録できない' do
        @order_address.telephone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone num can't be blank"
      end
      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_codeに"-"がないと登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'post_codeの3桁後に"-"ないと登録できない' do
        @order_address.post_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Post code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'telephone_numが9桁以下だと登録できない' do
        @order_address.telephone_num = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is too short'
      end
      it 'telephone_numが12桁以上だと登録できない' do
        @order_address.telephone_num = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is too short'
      end
      it 'telephone_numに半角英語が含まれている場合は登録できない' do
        @order_address.telephone_num = 'TellPhone'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is invalid. Input only number'
      end
      it 'telephone_numに半角カナが含まれている場合は登録できない' do
        @order_address.telephone_num = 'ﾃﾞﾝﾜﾊﾞﾝｺﾞｳ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is invalid. Input only number'
      end
      it 'telephone_numに全角数字が含まれている場合は登録できない' do
        @order_address.telephone_num = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is invalid. Input only number'
      end
      it 'telephone_numに全角カナが含まれている場合は登録できない' do
        @order_address.telephone_num = 'デンワバンゴウ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is invalid. Input only number'
      end
      it 'telephone_numにひらがなが含まれている場合は登録できない' do
        @order_address.telephone_num = 'でんわばんごう'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is invalid. Input only number'
      end
      it 'telephone_numに漢字が含まれている場合は登録できない' do
        @order_address.telephone_num = '電話番号'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone num is invalid. Input only number'
      end
      it 'user_idが空だと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
