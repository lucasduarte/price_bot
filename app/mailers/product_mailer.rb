class ProductMailer < ApplicationMailer
	def price_alert(alert)
    @alert = alert
		mail to: 'lucasduarte599@gmail.com', subject: "Price Alert! - " + alert.description + alert.id.to_s
  end
end
