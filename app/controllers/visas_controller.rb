class VisasController < ApplicationController
	respond_to :html, :json, only: [:index, :show, :search]
	def index
		@visas = Visa.all
	end
	
	def show
		@visa = Visa.find(params[:id])
	end
	
	def search
		@visas = Visa.joins(:subtype).merge(Subtype.migration(params[:immigration_id]))
      render :action=>"index"
	end
end
