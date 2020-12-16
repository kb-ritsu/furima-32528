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

  validates :name, :price, :category_id, :status_id, :fee_id, :place_id, :user, :detail, :day_id, presence: true
  validates :category_id,:status_id,:fee_id,:place_id,:day_id,  numericality: { other_than: 0 }
end
