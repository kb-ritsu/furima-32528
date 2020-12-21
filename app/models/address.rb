class Address < ApplicationRecord
  belongs_to :users_item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place
end
