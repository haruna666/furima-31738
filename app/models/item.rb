class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :quality
  belongs_to :prefecture
  belongs_to :shipped_date
  belongs_to :shipment_burden

  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
    validates :detail
    validates :category_id
    validates :quality_id
    validates :prefecture_id
    validates :shipped_date_id
    validates :shipment_burden_id
    validates :image
    validates :user_id
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :quality_id
    validates :prefecture_id
    validates :shipped_date_id
    validates :shipment_burden_id
  end
end
