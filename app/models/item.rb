class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  belongs_to :day_to_ship
  has_one_attached :image
  has_one :order

  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "が選択されていません" }
  validates :sales_status_id, numericality: { other_than: 1, message: "が選択されていません" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "が選択されていません" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "が選択されていません" }
  validates :day_to_ship_id, numericality: { other_than: 1, message: "が選択されていません" }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }, allow_blank: true
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, allow_blank: true
  validates :image, presence: true
end
