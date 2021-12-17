class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_area_id, presence: true
  validates :day_to_ship_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
