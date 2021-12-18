require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it 'item_name,item_text,category_id,sales_status_id,shipping_cost_id,shipping_area_id,day_to_ship_id,price,image,9つが存在し、userと紐付いていれば登録できる' do
      end
    end

    context '商品出品ができない場合' do
      it 'item_nameが空だと登録できない' do
      end
      it 'item_textが空だと登録できない' do
      end
      it 'category_idが1(---)だと登録できない' do
      end
      it 'sales_status_idが1(---)だと登録できない' do
      end
      it 'shipping_cost_idが1(---)だと登録できない' do
      end
      it 'shipping_area_idが1(---)だと登録できない' do
      end
      it 'day_to_ship_idが1(---)だと登録できない' do
      end
      it 'priceが空だと登録できない' do
      end
      it 'imageが空だと登録できない' do
      end

      it "priceが全角英字では登録できない" do
      end
      it "priceが全角数字では登録できない" do
      end
      it "priceが全角漢字では登録できない" do
      end
      it "priceが全角ひらがなでは登録できない" do
      end
      it "priceが半角英字では登録できない" do
      end
      it "priceが半角カタカナでは登録できない" do
      end
      it "priceが300円より小さければ登録できない" do
      end
      it "priceが9,999,999円より多ければ登録できない" do
      end

      it "userと紐付いていないと登録できない"do
      end
    end
  end
end
