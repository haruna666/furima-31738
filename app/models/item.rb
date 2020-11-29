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
	validates :price
	validates :detail
	validates :category_id
	validates :quality_id
	validates :prefecture_id
	validates :shipped_date_id
	validates :shipment_burden_id
	validates :image
	end

  validates :category_id, numericality: { other_than: 1, message:"Select"}
  validates :quality_id, numericality: { other_than: 1, message: "Select" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
  validates :shipped_date_id, numericality: { other_than: 1, message: "Select" }
  validates :shipment_burden_id, numericality: { other_than: 1, message: "Select" }
end
