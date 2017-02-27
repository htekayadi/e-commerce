require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  describe "GET #new" do
    let(:order) { create(:order) }
    subject { get :new }

    context "when status 'ok'" do
      before do
        allow(PaymentGatewayService).to receive(:process_payment).and_return( "ok" )
      end
      it "updates order's status as completed" do
        request.session[:order_id] = order.id
        subject
        order.reload
        expect(order.status).to eq("completed")
        expect(session[:order_id]).to be_nil
      end
    end

    context "when status 'reject'" do
      before do
        allow(PaymentGatewayService).to receive(:process_payment).and_return( "reject" )
      end
      it "updates order's status as rejected" do
        request.session[:order_id] = order.id
        subject
        order.reload
        expect(order.status).to eq("rejected")
      end
    end
  end
end
