class CartsController < ApplicationController

  before_action :authenticate_customer!

  def show
    @order = current_order
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end
end
