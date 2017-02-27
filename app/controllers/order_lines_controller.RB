class OrderLinesController < ApplicationController

  before_action :authenticate_customer!

  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_lines_params)
    @order.save 
    session[:order_id] = @order.id
    flash[:success] = "Item added to cart"
    redirect_to request.referer || root_path
  end

  def update
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.update_attributes(order_lines_params)
    @order_lines = @order.order_lines
    redirect_to request.referer || root_path
  end

  def destroy
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.destroy
    @order_lines = @order.order_lines
    flash[:success] = "Item is removed from cart"
    redirect_to request.referer || root_path
  end

  private
  def order_lines_params
    params.require(:order_line).permit(:qty, :unit_price, :product_id)
  end

end
