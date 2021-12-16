require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email、password、password_confirmation、last_name、last_name_kana,、first_name、first_name_kana、date_of_birthの９つが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録/ユーザー情報' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailには＠が含まれていること' do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordは5文字以下では登録ができない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordは全角英字では登録できない' do
        @user.password = 'ａａａＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordは全角数字では登録できない' do
        @user.password = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordとpassword_confirmationの値が一致していないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end

    context '新規登録/本人情報確認' do
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end

      it 'last_nameが全角英字では登録できない' do
        @user.last_name = 'Ｔａｎａｋａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'last_nameが全角数字では登録できない' do
        @user.last_name = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'last_nameが半角英字では登録できない' do
        @user.last_name = 'Tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'last_nameが半角数字では登録できない' do
        @user.last_name = '123456790'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'last_name_kanaが全角英字では登録できない' do
        @user.last_name_kana = 'Ｔａｎａｋａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが全角数字では登録できない' do
        @user.last_name_kana = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが全角漢字では登録できない' do
        @user.last_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが全角ひらがなでは登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが半角英字では登録できない' do
        @user.last_name_kana = 'Tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが半角数字では登録できない' do
        @user.last_name_kana = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが半角カタカナでは登録できない' do
        @user.last_name_kana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'first_nameが全角英字では登録できない' do
        @user.first_name = 'Ｔａｒｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'first_nameが全角数字では登録できない' do
        @user.first_name = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'first_nameが半角英字では登録できない' do
        @user.first_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'first_nameが半角数字では登録できない' do
        @user.first_name = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'first_name_kanaが全角英字では登録できない' do
        @user.first_name_kana = 'Ｔａｒｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが全角数字では登録できない' do
        @user.first_name_kana = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが全角漢字では登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが全角ひらがなでは登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが半角英字では登録できない' do
        @user.first_name_kana = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが半角数字では登録できない' do
        @user.first_name_kana = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが半角カタカナでは登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
    end
  end
end
