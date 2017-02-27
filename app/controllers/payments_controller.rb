class PaymentsController < ApplicationController
  STATUS_OK = "ok".freeze
  STATUS_REJECT = "reject".freeze

  def new
    response = PaymentGatewayService.process_payment
    order = current_order
    if response == STATUS_OK
      if order.update(status: "completed")
        session[:order_id] = nil
        redirect_to carts_path, notice: "Order no #{order.order_no} is confirmed."
      else
        redirect_to carts_path, alert: "Error - cannot make payment to the order no #{order.order_no}"
      end
    elsif response == STATUS_REJECT
      if order.update(status: "rejected")
        redirect_to carts_path, notice: "Order no #{order.order_no} is rejected."
      else
        redirect_to carts_path, alert: "Error - cannot make payment to the order no #{order.order_no}"
      end
    else
      redirect_to carts_path, alert: "Error - with payment"
    end
  rescue => e
    log_error(e)
  end

  private

  def log_error(error)
    Rails.logger.error(error.to_s)
    Rails.logger.error(error.backtrace.join("\n"))
  end
end
