class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :move_to_index, expect: [:index]

	def index
		@order = Item.find(params[:item_id])
	end

	def create
		@order = Order.create(order_params)
		if @order.valid?
			@order.save
			return redirect_to root_path
		else
			render 'sessions/new'
		end
	end

	private

	def order_params
		params.require(:order).permit(:name, :price, :shipment_burden_id ).merge(user_id: current_user.id)
	end

	def move_to_index
		unless user_signed_in? && current_user.id || @item.user.id
		redirect_to root_path
		end
	end
end
