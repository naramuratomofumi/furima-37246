require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it 'item_name,item_text,category_id,sales_status_id,shipping_cost_id,shipping_area_id,day_to_ship_id,price,image,9つが存在し、userと紐付いていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_textが空だと登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item text can't be blank"
      end
      it 'category_idが1(---)だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'sales_status_idが1(---)だと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end
      it 'shipping_cost_idが1(---)だと登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it 'shipping_area_idが1(---)だと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'day_to_ship_idが1(---)だと登録できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day to ship can't be blank"
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'priceが全角英字では登録できない' do
        @item.price = 'ａａａＡＡＡ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '１２３４５６７８９０'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが全角漢字では登録できない' do
        @item.price = '一二三四五六七八九十'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが全角ひらがなでは登録できない' do
        @item.price = 'いちにさんよんごろくななはちきゅう'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'aaaAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが半角カタカナでは登録できない' do
        @item.price = 'ｲﾁﾆｻﾝｼｺﾞﾛｸﾅﾅﾊﾁｷｭｳ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end
      it 'priceが300円より小さい場合、登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが9,999,999円より大きい場合、登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceがマイナスの場合、登録できない' do
        @item.price = '-1000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end

      it 'userと紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
