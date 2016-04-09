class AlertsController < ApplicationController
	before_action :set_alert, only: [:show, :destroy]
	
	def index
		@alerts = Alert.all
	end
	
	def show
	end
	
	def destroy
		@alert.destroy
    respond_to do |format|
			format.html { redirect_to alerts_url, notice: 'Alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
	
	def check_alerts
		Product.update_price
		redirect_to alerts_url
	end
	
	private
		def set_alert
			@alert = Alert.find(params[:id])
    end
end
