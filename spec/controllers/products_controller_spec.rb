require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  login_admin

  describe "GET #index" do
    subject { get :index }
    it { is_expected.to be_success }
  end

  describe "GET #show" do
    let(:product) { create(:product) }
    subject { get :show, id: product.id }
    it { should be_success }
  end

  describe "GET #edit" do
    let(:product) { create(:product) }
    subject { get :edit, id: product.id }
    it { is_expected.to be_success }
  end

  describe "GET #new" do
    subject { get :new }
    it { is_expected.to be_success }
  end

  describe "POST #create" do
    product_params = {
      name: "Test Product",
      price: 2,
      description: "product description",
      status: true
    }
    subject { post :create, product: product_params }

    it "increases the count of order lines" do
      expect { subject }.to change(Product, :count).by(1)
    end

    it "creates a new product" do
      subject
      product = Product.last
      expect(product.name).to eq(product_params[:name])
      expect(product.price).to eq(product_params[:price])
      expect(product.description).to eq(product_params[:description])
      expect(product.status).to be(product_params[:status])
    end

    it "redirects to show page" do
      expect(subject).to redirect_to(product_path(assigns(:product)))
    end

    it "returns notice" do
      subject
      expect(flash[:notice]).to eq "Product was successfully created."
    end
  end

  describe "PATCH #update" do
    let(:product) { create(:product)}
    product_params = { name: "Test name", description: "Test description", price: 12.2, status: 1  }
    subject { patch :update, id: product.id, product: product_params }
    
    it "must be equal to updated order line" do
      subject
      product.reload
      expect(product.price).to eq 12.2
    end

    it "should redirect" do
      expect(response.status).to eq(200)
    end

    it "redirects to product path" do
      expect(subject).to redirect_to(assigns(:product))
    end

    it "returns notice" do
      subject
      expect(flash[:notice]).to eq "Product was successfully updated."
    end
  end

  describe "DELETE #destroy" do
    let(:product) { create(:product) }
    subject { delete :destroy, id: product.id}

    it "redirects to index page" do
      expect(subject).to redirect_to(products_url)
    end
  end

end
