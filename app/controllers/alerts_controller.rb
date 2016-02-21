class AlertsController < ApplicationController
	def index
		@alerts = Alert.all
	end
	
	def show
	end
end
