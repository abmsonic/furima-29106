class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_day

  with_options presence: true do
    validates :name
    validates :image
    validates :info
    validates :category_id
    validates :status_id
    validates :ship_day_id
    validates :price
    validates :user_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number'}
  validates :price, numericality: { greater_than_or_equal_to: 300,
     less_than_or_equal_to: 9999999,
     message: 'Out of setting range'
     }

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :ship_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :ship_day_id, numericality: { other_than: 1 }
end
