require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context 'アイテムが保存できる場合' do
      it 'image,name,info,category,sales_status,shipping_fee_status,prefecture,scheduled_delivery,priceがあれば商品は保存される' do
        expect(@item).to be_valid
      end
    end
    context 'itemが保存できない場合' do
      it 'imageがないとitemは保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないとitemは保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoがないとitemは保存できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'categoryがないとitemは保存できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_statusがないとitemは保存できない' do
        @item.sales_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number")
      end
      it 'shipping_fee_statusがないとitemは保存できない' do
        @item.shipping_fee_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", "Shipping fee status is not a number")
      end
      it 'prefectureがないとitemは保存できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_deliveryがないとitemは保存できない' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
      end
      it 'categoryが１だとitemは保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'sales_statusが１だとitemは保存できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end
      it 'shipping_fee_statusが１だとitemは保存できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end
      it 'prefectureが１だとitemは保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'scheduled_deliveryが１だととitemは保存できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
      it 'priceがないとitemは保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下では出品できない' do
        @item.price = 298
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10_000_000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角英数字混合では出品できない' do
        @item.price = '200a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英字のみでは出品できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角文字では出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いてないとitemは保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
