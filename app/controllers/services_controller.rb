class ServicesController < ApplicationController
	def index
		@services = Service.all

		@graph_size = {
			:height => 300,
			:width => 600
		}

		graph_data = {
			labels: ['1', '2', '3'],
			datasets: []
		}

		@services.each do |service|
			data = []
			service.readings.last(3).each do |reading|
				data.push(reading.value)
			end

			graph_data[:datasets].push({
				label: service.name,
				fillColor: 'rgba(128,128,128,0.5)',
				data: data
			})
		end

		@data = graph_data.to_json
	end

	def new
		@service = Service.new
	end

	def create
		service = Service.new(service_params)
		service.save
		redirect_to root_path
	end

	private
	def service_params
		params.require(:service).permit(:name, :icon)
	end
end
