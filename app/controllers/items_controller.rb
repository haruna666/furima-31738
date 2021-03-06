class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :move_to_index, only: [:edit]

  def index
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

  def edit
    redirect_to root_path if @item.order.present? || current_user.id != @item.user.id
  end

  def show
  end

  def update
    current_user.id == @item.user.id
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :category_id, :quality_id, :prefecture_id, :shipped_date_id, :shipment_burden_id, images: []).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to root_path if user_signed_in?
  # end


  def set_item
    @item = Item.find(params[:id])
  end
end

