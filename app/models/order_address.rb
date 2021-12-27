class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipalities, :address, :building_num, :telephone_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を正しく入力してください(例 123-4567)' }
    validates :municipalities
    validates :address
    validates :telephone_num, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'は10桁か11桁で入力してください' },
                              numericality: { only_integer: true, message: 'は半角数字のみで入力してください' }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefectures_id, numericality: { other_than: 1, message: 'が選択されていません' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address,
                   building_num: building_num, telephone_num: telephone_num, order_id: order.id)
  end
end
