class Item < ApplicationRecord

  belongs_to :user
  has_one    :users_item
  has_one_attached :image

  validates :name
  validates
end
