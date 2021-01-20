class OrdersController < ApplicationController
  before_action :move_to_session, only: :index
  before_action :correct_user, only: :index
  before_action :buy_out, only: :index
  before_action :set_item

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def correct_user
    redirect_to root_path if current_user.id == Item.find(params[:item_id]).user.id
  end

  def buy_out
    redirect_to root_path unless Item.find(params[:item_id]).purchase.nil?
  end

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
