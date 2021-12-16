require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email、password、password_confirmation、last_name、last_name_kana,、first_name、first_name_kana、date_of_birthの９つが存在すれば登録できる' do
      end
    end

    context "新規登録/ユーザー情報" do

      it "nicknameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "passwordが空では登録できない" do
      end

      it "重複したemailが存在する場合は登録できない" do
      end

      it "emailには＠が含まれていること" do
      end

      it "passwordは5文字以下では登録ができない" do
      end
      it "passwordは半角数字のみでは登録できない" do
      end
      it "passwordは半角英字のみでは登録できない" do
      end
      it "passwordは全角英字では登録できない" do
      end
      it "passwordは全角数字では登録できない" do
      end


      it "passwordとpassword_confirmationの値が一致していないと登録できない" do
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
