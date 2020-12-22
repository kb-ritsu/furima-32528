class Order
  include ActiveModel::Model
  attr_accessor :place_id, :city, :address, :building, :phone_number, :address_number, :token,:order_user_id, :item_id

 with_options presence: true do
  validates :city, :address, :order_user_id,:item_id
  validates :place_id,  numericality: { other_than: 0 }
  validates :token, presence: true
  validates :address_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: {with: /\d{9,11}/}, length: {maximum: 11}
 end
  def save
    users_item = UsersItem.create(item_id: item_id, user_id: order_user_id)
    Address.create!(city: city,address_number: address_number, address: address, building: building, phone_number: phone_number, building: building,place_id: place_id, users_item_id: users_item.id) 

  end
end