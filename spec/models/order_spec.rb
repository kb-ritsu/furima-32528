require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "フォームを全て入力すると保存ができること" do
    expect(@order).to be_valid
  end

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

end