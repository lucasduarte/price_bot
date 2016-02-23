class Alert < ActiveRecord::Base
	def Alert.check_alerts
		alerts = Alert.where(:mail_sent => false)
    alerts.each do |alert|
      Alert.send_mail alert
      #alert.destroy
    end
  end

  def Alert.send_mail alert
    ProductMailer.price_alert(alert).deliver_now
  end
end
