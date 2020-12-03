class OrdersController < ApplicationController

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

end
