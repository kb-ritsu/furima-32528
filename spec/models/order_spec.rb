require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
 describe '購入機能の保存' do
  context 'うまくいく場合' do
    it "フォームを全て入力すると保存ができること" do
      expect(@order).to be_valid
    end
    it "建物番号のカラムが空でも登録できる" do
      @order.building = nil
      expect(@order).to be_valid
    end
  end
  context 'うまくいかない場合' do
    it "address_numberが空では登録できないこと" do
      @order.address_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address number can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it "place.idが空だと登録できない" do
      @order.place_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Place can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "address_numberがハイフン無しでは登録できないこと" do
      @order.address_number = "1270026"
      @order.valid?
      expect(@order.errors.full_messages).to include("Address number is invalid")
    end

    it "phone_numberがハイフンありでは登録できないこと" do
      @order.phone_number = "090-2272-5607"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end


    it "電話番号が１１文字より多い場合は登録できない" do
      @order.phone_number = "012345678901"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "item_idが空なら登録できない" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it "user_idが空なら登録できない" do
      @order.order_user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Order user can't be blank")
    end
    it "place_idが0なら登録できない" do
      @order.place_id = "0"
      @order.valid?
      expect(@order.errors.full_messages).to include("Place must be other than 0")
    end

  end
 end
end