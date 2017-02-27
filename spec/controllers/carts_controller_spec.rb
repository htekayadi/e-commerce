require "rails_helper"

RSpec.describe CartsController, type: :controller do 
  login_customer

  describe "GET #show" do
    it "should render show template" do
      get :show
      expect(response).to render_template("show")
    end

    it "should have an order" do
      get :show
      expect(assigns(:order)).not_to be_nil
    end
  end
end