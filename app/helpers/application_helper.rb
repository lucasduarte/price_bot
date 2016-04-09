module ApplicationHelper
	def get_alerts_count
		count = Alert.where(:visited => false).count
	end
end
