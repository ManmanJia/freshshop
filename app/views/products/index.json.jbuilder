json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :weight, :description, :image_url
  json.url product_url(product, format: :json)
end
