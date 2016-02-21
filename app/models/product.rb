class Product < ActiveRecord::Base
	belongs_to :website
	belongs_to :category
	validates :website, presence: true
	
	def Product.update_price
    begin
      products = Product.all
      products.each do |p|
        agent = Mechanize.new
        page = agent.get(p.link)

        agent.shutdown()
        price = page.search(p.website.discounted_price_tag).to_s
                                                         .delete("^0-9,")
                                                         .gsub(',','.')
                                                         .to_d.round(2)

        if price == 0
          price = page.search(p.website.regular_price_tag).to_s
                                                           .delete("^0-9,")
                                                           .gsub(',','.')
                                                           .to_d.round(2)
        end

        range_price = p.last_price * (p.category.alert_range.to_d / 100)

        if price < range_price and price > 0
          alert = Alert.new
          alert.description = p.description
          alert.link = p.link
          alert.image = p.image
          alert.old_price = p.last_price
          alert.last_price = price
					alert.mail_sent = false
					alert.visited = false
          alert.save
        end

        if price > 0
          p.last_price = price
        end

        p.save
        Alert.check_alerts
      end
    rescue => ex
      ex.message
    end

  end

  def Product.first_search product
    begin
      agent = Mechanize.new
      page = agent.get(product.link)
      agent.shutdown()
      price = page.search(product.website.discounted_price_tag).to_s
                                                       .delete("^0-9,")
                                                       .gsub(',','.')
                                                       .to_d.round(2)
      if price == 0
        price = page.search(product.website.regular_price_tag).to_s
                                                        .delete("^0-9,")
                                                        .gsub(',','.')
                                                        .to_d.round(2)
      end

      product.last_price = price
      product.image = page.search(product.website.product_image_tag).first
      product.description = page.search(product.website.product_description_tag).first
			
      product.save
    rescue => ex
			debugger
      ex.message
    end
  end
end
