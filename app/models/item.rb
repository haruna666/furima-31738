class Item < ApplicationRecord

	belongs_to :user
	has_one_attached :image
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :category
	belongs_to :quality
	belongs_to :prefecture
	belongs_to :shipped_date
	belongs_to :shipment_burden

	validates :name, :price, :detail, :category_id, :quality_id, :prefecture_id, :shipped_date_id, :shipment_burden_id, :user_id, presence: true

	validates :category_id, numericality: { other_then: 1 }
	validates :quality_id, numericality: { other_then: 1 }
	validates :prefecture_id, numericality: { other_then: 1 }
	validates :shipped_date_id, numericality: { other_then: 1 }
	validates :shipment_burden_id, numericality: { other_then: 1 }

end
