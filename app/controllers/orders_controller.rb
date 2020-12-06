class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :move_to_index, expect: [:index]

	def index
		@item = Item.find(params[:item_id])
		@userorder = UserOrder.new
	end

	def create
		@userorder = UserOrder.new(order_params)
		if @userorder.valid?
			Payjp.api_key = "sk_test_f7e22c0b893dd0a05fc2626f"
			Payjp::Charge.create(
				amount: order_params[:price],
				card: order_params[:token],
				currency: 'jpy'
			)
			@userorder.save
			return redirect_to root_path
		else
			redirect_to root_path
		end
	end

	private

	def order_params
		params[:userorder].permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id)
	end

	def move_to_index
		unless user_signed_in? && current_user.id || @item.user.id
		redirect_to root_path
		end
	end
end
