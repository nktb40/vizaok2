class VisasController < ApplicationController
	respond_to :html, :json, only: [:index, :show, :search]
	def index
		#@countries = Country.all
		@visas = Visa.all
		@visatypes = Subtype.all
	end
	
	def show
		@visa = Visa.find(params[:id])
	end
	
	def search
		#@visas = Visa.joins(:subtype).merge(Subtype.migration(params[:immigration_id]))
		@visas = Visa.where(:subtype_id => params[:visatypes])
	end
end
