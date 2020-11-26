class ItemsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
	end

	def new
		@item = Item.new
	end

	def create
		Item.create(item_params)
	end

	private

	def item_params
		params.require(:item).premit(:image, :text)
	end
end
