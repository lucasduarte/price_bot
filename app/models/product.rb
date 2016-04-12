class Product < ActiveRecord::Base
	belongs_to :website
	belongs_to :category
	validates :website, presence: true
	
	def Product.update_price
    begin
			products = Product.where(:status => true)
      products.each do |p|
				
				data = Hash.new

				data["regular_price"] = p.website.discounted_price_tag
				data["discounted_price"] = p.website.discounted_price_tag
				
				result = Procurator.new.search p.link, data
				
				price = result["regular_price"].to_s.delete("^0-9,").gsub(',','.').to_d

        range_price = p.last_price * (p.category.alert_range.to_d / 100)

				if price > 0
					p.last_price = price	
					
					if price < range_price
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
				else
					if p.fail_count == 4
						p.status = false
					end
					p.fail_count += 1		
				end
				
				p.save
        #Alert.check_alerts
      end
    rescue => ex
      ex.message
    end

  end

	
	def Product.first_search product
		data = Hash.new
		
		data["discounted_price"] = product.website.discounted_price_tag
		data["regular_price"] = product.website.regular_price_tag
		data["image"] = product.website.product_image_tag
		data["description"] = product.website.product_description_tag
		
		p = Procurator.new
		result = p.search product.link, data
		
		price = result["regular_price"].to_s.delete("^0-9,").gsub(',','.').to_d
		
		if price > 0
			product.last_price = price
			product.image = result["image"]
			product.description = result["description"]
			
			product.save
		end
	end
end
