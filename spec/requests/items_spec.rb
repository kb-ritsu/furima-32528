require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    it "全ての情報を入力すると登録できる" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "imageがからでは登録できない事"do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "statusが空では登録できないこと" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it "feeが空では登録できないこと" do
      @item.fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 0")
    end
    it "placeが空では登録できないこと" do
      @item.place_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Place must be other than 0")
    end
    it "Dayが空では登録できないこと" do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 0")
    end
    it "priceが文字では登録できないこと" do
      @item.price = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが300以上でなければ登録できないこと" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "priceが999999以下でなければ登録できないこと" do
      @item.price = 9999999999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "半角英数字混合では登録できない事" do
      @item.price = "999a"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "全角文字では登録できない事" do
      @item.price ="９９９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end