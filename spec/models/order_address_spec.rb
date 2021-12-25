require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
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
        expect(@order_address.errors.full_messages).to include 'Telephone num is too short.'
      end
    end
  end
end
