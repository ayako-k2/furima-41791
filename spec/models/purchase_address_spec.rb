require 'rails_helper'

  RSpec.describe PurchaseAddress, type: :model do
  before do 
    @user = FactoryBot.create(:user)  
    @item = FactoryBot.create(:item, user: @user)  
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @purchase_address.postalcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode can't be blank")
      end
      it '郵便番号に全角が含まれると登録できない' do
        @purchase_address.postalcode = '１２３-4567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンが含まれていないとと登録できない' do
        @purchase_address.postalcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
      end
      it '都道府県の地域が空では保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end  
      it '市区町村の地域が空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end  
      it '番地の地域が空では保存できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end  
      it '番地の地域が空では保存できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end  
      it "電話番号が空では登録できない" do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号に全角が含まれると登録できない' do
        @purchase_address.tel = '１２３456789999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid. It should be 10 to 11 digits without hyphens.')
      end
      it '電話番号が9桁以下だと登録できない' do
        @purchase_address.tel = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid. It should be 10 to 11 digits without hyphens.')
      end
      it '電話番号が12桁以上だと登録できない' do
        @purchase_address.tel = '12345678999999'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid. It should be 10 to 11 digits without hyphens.')
      end
      it '電話番号にハイフンが含まれると登録できない' do
        @purchase_address.tel = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid. It should be 10 to 11 digits without hyphens.')
      end    
      it 'user_idが存在しなければ登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end  
      it 'item_idが存在しなければ登録できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end    
      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end    
    end
  end
end

