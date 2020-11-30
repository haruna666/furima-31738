class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @item =Item.all
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

	def create
		@item = Item.new(item_params)
		if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  # end

  # def show
  #   @item = Item.find(parms[:id])
  # end

  # def update
  #   if current_user.update(item_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :detail, :category_id, :quality_id, :prefecture_id, :shipped_date_id, :shipment_burden_id).merge(user_id: current_user.id)
  end
end
