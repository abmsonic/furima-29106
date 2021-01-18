class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
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
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_day_id
    validates :price
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_day_id
  end

  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'Out of setting range' }
end
