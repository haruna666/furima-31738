class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_order_item

  def index
    @userorder = UserOrder.new
    redirect_to root_path if @item.order.present? || current_user.id == @item.user.id
  end

  def create
    @userorder = UserOrder.new(order_params)
    if @userorder.valid?
      pay_item
      @userorder.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order_item
    @item = Item.find(params[:item_id])
  end
end
