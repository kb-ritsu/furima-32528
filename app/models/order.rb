class Order
  include ActiveModel::Model
  attr_accessor :place_id, :city, :address, :building, :phone_number, :address_number, :token,:order_user_id, :item_id
with_options presence: true do
  validates :city, :address,:phone_number
  validates :place_id,  numericality: { other_than: 0 }
  validates :token, presence: true
  validates :address_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
end
  def save
    UsersItem.create(item_id: item_id, user_id: order_user_id)
    Address.create!(city: city,address_number: address_number, address: address, building: building, phone_number: phone_number, building: building,place_id: place_id, users_item_id: order_user_id) 
  end
end