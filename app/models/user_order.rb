class UserOrder
	include ActiveModel::Model
	attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

	with_options presence: true do
		validates :user_id
		validates :item_id
		validates :token 
	end

	with_options presence: true do
		validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
		validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
		validates :city,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
		validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
		validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Input 11 characters."}
	end

	def save
		# user = User.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number)
		Order.create(user_id: user_id, item_id: item_id)
		Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, address: address, phone_number: phone_number)
	end
end