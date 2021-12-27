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
        expect(@order_address.errors.full_messages).to include '郵便番号を入力してください'
      end
      it 'prefectures_idが"---"(1)だと登録できない' do
        @order_address.prefectures_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '都道府県が選択されていません'
      end
      it 'municipalitiesが空だと登録できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '市区町村を入力してください'
      end
      it 'addressが空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '番地を入力してください'
      end
      it 'telephone_numが空だと登録できない' do
        @order_address.telephone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号を入力してください'
      end
      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'カード情報を入力してください'
      end
      it 'post_codeに"-"がないと登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '郵便番号を正しく入力してください(例 123-4567)'
      end
      it 'post_codeの3桁後に"-"ないと登録できない' do
        @order_address.post_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '郵便番号を正しく入力してください(例 123-4567)'
      end
      it 'telephone_numが9桁以下だと登録できない' do
        @order_address.telephone_num = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は10桁か11桁で入力してください'
      end
      it 'telephone_numが12桁以上だと登録できない' do
        @order_address.telephone_num = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は10桁か11桁で入力してください'
      end
      it 'telephone_numに半角英語が含まれている場合は登録できない' do
        @order_address.telephone_num = 'TellPhone'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は半角数字のみで入力してください'
      end
      it 'telephone_numに半角カナが含まれている場合は登録できない' do
        @order_address.telephone_num = 'ﾃﾞﾝﾜﾊﾞﾝｺﾞｳ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は半角数字のみで入力してください'
      end
      it 'telephone_numに全角数字が含まれている場合は登録できない' do
        @order_address.telephone_num = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は半角数字のみで入力してください'
      end
      it 'telephone_numに全角カナが含まれている場合は登録できない' do
        @order_address.telephone_num = 'デンワバンゴウ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は半角数字のみで入力してください'
      end
      it 'telephone_numにひらがなが含まれている場合は登録できない' do
        @order_address.telephone_num = 'でんわばんごう'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は半角数字のみで入力してください'
      end
      it 'telephone_numに漢字が含まれている場合は登録できない' do
        @order_address.telephone_num = '電話番号'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は半角数字のみで入力してください'
      end
      it 'user_idが空だと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Userを入力してください'
      end
      it 'item_idが空だと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Itemを入力してください'
      end
    end
  end
end
