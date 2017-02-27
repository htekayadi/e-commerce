class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def after_sign_in_path_for(resource)
    products_path
  end

  def current_order
    if session[:order_id].nil?
      Order.new do |u|
        u.customer = current_customer
        u.status = "cart"
      end
    else
      Order.find(session[:order_id])
    end
  end
end
