class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :move_to_index, expect: [:index]
	before_action :set_order_item

	def index
		@userorder = UserOrder.new
	end

	def create
		@userorder = UserOrder.new(order_params)
		if @userorder.valid?
			pay_item
			@userorder.save
			return redirect_to root_path
		else
			render :index
		end
	end

	private

	def order_params
		params.permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id)
	end

	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
		Payjp::Charge.create(
			amount: @item.price,
			card: order_params[:token],
			currency: 'jpy'
		)
	end

	def move_to_index
		unless user_signed_in? && current_user.id || @item.user.id
		redirect_to root_path
		end

		def set_order_item
			@item = Item.find(params[:item_id])
		end
	end
end
