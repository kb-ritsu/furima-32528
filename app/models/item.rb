class Item < ApplicationRecord

  belongs_to :user
  has_one    :users_item
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :place
  belongs_to :day

  validates :name, :category_id, :status_id, :fee_id, :place_id, :detail, :day_id,:image, presence: true
  validates :category_id,:status_id,:fee_id,:place_id,:day_id,  numericality: { other_than: 0 }
  validates :price, presence: true, numericality: {greater_than: 300,less_than: 9999999} ,format: { with: /[0-9]/, message: "is invalid."}
end

