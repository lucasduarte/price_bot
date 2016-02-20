json.array!(@products) do |product|
  json.extract! product, :id, :description, :link, :image, :last_price, :alert_range, :website_id, :category_id
  json.url product_url(product, format: :json)
end
