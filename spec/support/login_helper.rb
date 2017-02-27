module LoginHelper
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in create(:admin)
    end
  end

  def login_customer
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:customer]
      sign_in create(:customer)
    end
  end
end