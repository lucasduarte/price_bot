json.array!(@websites) do |website|
  json.extract! website, :id, :name, :link, :logo, :regular_price_tag, :discounted_price_tag, :product_description_tag, :product_image_tag, :status
  json.url website_url(website, format: :json)
end
