class PagesController < ApplicationController
	def index
		@countries = Country.all
		@purposes = Purpose.all
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id").where("p.name = ?", "Иммиграция")
	end
	
	def migration
		@order = Order.new
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id").where("p.name = ?", "Иммиграция")
	end
end
