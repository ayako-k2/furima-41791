require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
       it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
       end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'passwordに全角が含まれると登録できない' do
        @user.password = 'abc１２３'
        @user.password_confirmation = 'abc１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "お名前(全角)名字が空では登録できない" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "お名前(全角)名前が空では登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'お名前(全角)名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.lastname = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid. Input full-width characters.')
      end
      it 'お名前(全角)名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.firstname = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid. Input full-width characters.')
      end
      it "お名前カナ(全角)名字が空では登録できない" do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it "お名前カナ(全角)名前が空では登録できない" do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'お名前カナ(全角)名字が全角（カタカナ）での入力でないと登録できない' do
        @user.lastname_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid. Input full-width katakana characters.')
      end
      it 'お名前カナ(全角)名字が全角（カタカナ）での入力でないと登録できない' do
        @user.firstname_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid. Input full-width katakana characters.')
      end
      it "誕生日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end





