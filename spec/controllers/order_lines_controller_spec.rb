require 'rails_helper'

RSpec.describe OrderLinesController, type: :controller do 
  login_customer

  before(:each) do
    @order_line_params = { qty: 3, unit_price: 1.5, product_id: create(:product).id }
  end

  describe "POST #create" do

    it "increase the count of order lines" do
      expect {
        post :create, order_line: @order_line_params
      }.to change(OrderLine, :count).by(1)
    end

    it "should redirect" do
      post :create, order_line: @order_line_params
      expect(response.status).to eq(302)
    end

  end

  describe "PATCH #update" do
    let(:order) { create(:order) }
    let(:order_line) { create(:order_line, order: order) }

    before(:each) do
      request.session[:order_id] = order.id
      post :update, order_line: @order_line_params, id: order_line.id
    end

    it "must be equal to updated order line" do
      order_line.reload
      expect(order_line.qty).to eq 3
    end

    it "should redirect" do
      expect(response.status).to eq(302)
    end

  end

  describe "DELETE #destroy" do

    before(:each) do
      @order = create(:order)
      @order_line = create(:order_line, order: @order)
    end

    it "decrease the count of order lines" do
      request.session[:order_id] = @order.id
      expect {
      delete :destroy, order_line: @order_line_params, id: @order_line.id
      }.to change(OrderLine, :count).by(-1)
    end

    it "should redirect" do
      request.session[:order_id] = @order.id
      delete :destroy, order_line: @order_line_params, id: @order_line.id
      expect(response.status).to eq(302)
    end

  end
  
end