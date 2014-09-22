class CatalogsController < ApplicationController
	def show
		@catalog = Catalog.find(params[:id])
		@visas = @catalog.visas
		@selected_country = @catalog.country
		@purposes = Purpose.joins("JOIN LNK_VISA_PURPOSES VP ON VP.purpose_id = purposes.id JOIN Visas on vp.visa_id = visas.id").where("visas.country_id = ?", @selected_country.id).uniq	
		@order = Order.new
		@visa_country = @selected_country.name
	end
end
