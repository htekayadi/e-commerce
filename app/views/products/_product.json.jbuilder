json.extract! product, :id, :description, :name, :price, :status, :created_at, :updated_at
json.url product_url(product, format: :json)