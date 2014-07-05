class VisasController < ApplicationController
	def index
	end
	
	def show
		@visa = Visa.find(params[:id])
	end
end
