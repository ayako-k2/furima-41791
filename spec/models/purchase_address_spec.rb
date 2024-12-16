require 'rails_helper'
  RSpec.describe Purchase, type: :model do
  before do 
    @purchase_address = FactoryBot.build(:purchase)
  end

  describe '購入情報の保存' do
    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
    end

    context '保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @purchase_address.postalcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode can't be blank")
      end

      # 他のテストケースも追加する
    end
  end
    
end