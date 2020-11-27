class ItemsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@items = Item.order("created_at DESC")
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to root_path
		else
			render template: "sessions/new"
		end
	end

	private

	def item_params
		params.require(:item).permit(:image, :text, :category_id, :quality_id, :prefecture_id)
	end
end
