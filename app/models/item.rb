class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :prefecture
  belongs_to :shipped_date
  belongs_to :shipment_burden

	with_options presence: true do
	validates :name
	validates :price, length: { in: 300..9999999 }
	validates :detail
	validates :category_id
	validates :quality_id
	validates :prefecture_id
	validates :shipped_date_id
	validates :shipment_burden_id
	validates :image
	end

  with_options numericality: { other_than: 1, message:"Select"} do
  validates :category_id
  validates :quality_id
  validates :prefecture_id
  validates :shipped_date_id
  validates :shipment_burden_id
  end
end
