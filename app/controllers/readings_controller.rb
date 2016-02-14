class ReadingsController < ApplicationController
	def new
		@service = Service.find(params[:service_id])
		@reading = Reading.new
	end

	def create
		service = Service.find(params[:service_id])
		service.readings.new(reading_params)
		service.save
		redirect_to root_path
	end

	private
	def reading_params
		params.require(:reading).permit(:value)
	end
end
