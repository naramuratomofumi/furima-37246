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

    context "新規登録/ユーザー情報" do

      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "emailには＠が含まれていること" do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it "passwordは5文字以下では登録ができない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordは半角数字のみでは登録できない" do
        @user.password = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end

      it "passwordは半角英字のみでは登録できない" do
        @user.password = 'aaaAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end

      it "passwordは全角英字では登録できない" do
        @user.password = 'ａａａＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end

      it "passwordは全角数字では登録できない" do
        @user.password = '１２３４５６７８９０'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end


      it "passwordとpassword_confirmationの値が一致していないと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end

    context "新規登録/本人情報確認" do
      
      it "last_nameが空では登録できない" do
      end
      it "last_name_kanaが空では登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "first_name_kanaが空では登録できない" do
      end
      it "date_of_birthが空では登録できない" do
      end

      it "last_nameが全角英字では登録できない" do
      end
      it "last_nameが全角数字では登録できない" do
      end
      it "last_nameが半角英字では登録できない" do
      end
      it "last_nameが半角数字では登録できない" do
      end

      it "last_name_kanaが全角英字では登録できない" do
      end
      it "last_name_kanaが全角数字では登録できない" do
      end
      it "last_name_kanaが全角漢字では登録できない" do
      end
      it "last_name_kanaが全角ひらがなでは登録できない" do
      end
      it "last_name_kanaが半角英字では登録できない" do
      end
      it "last_name_kanaが半角数字では登録できない" do
      end
      it "last_name_kanaが半角カタカナでは登録できない" do
      end

      it "first_nameが全角英字では登録できない" do
      end
      it "first_nameが全角数字では登録できない" do
      end
      it "first_nameが半角英字では登録できない" do
      end
      it "first_nameが半角数字では登録できない" do
      end

      it "first_name_kanaが全角英字では登録できない" do
      end
      it "first_name_kanaが全角数字では登録できない" do
      end
      it "first_name_kanaが全角漢字では登録できない" do
      end
      it "first_name_kanaが全角ひらがなでは登録できない" do
      end
      it "first_name_kanaが半角英字では登録できない" do
      end
      it "first_name_kanaが半角数字では登録できない" do
      end
      it "first_name_kanaが半角カタカナでは登録できない" do
      end
    end
  end
end
