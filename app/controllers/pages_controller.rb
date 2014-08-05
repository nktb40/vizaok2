# encoding: utf-8
class PagesController < ApplicationController
	def index
		@countries = Country.all
		@purposes = Purpose.all
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id LEFT JOIN countries c ON c.id = visas.country_id").where("p.name = ? and c.name = ?", "Иммиграция", "США")
	end
	
	def usa_migration
		@order = Order.new
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id LEFT JOIN countries c ON c.id = visas.country_id").where("p.name = ? and c.name = ?", "Иммиграция", "США")
	end
	
	def au_migration
		@order = Order.new
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id LEFT JOIN countries c ON c.id = visas.country_id").where("p.name = ? and c.name = ?", "Иммиграция", "Австралия")
	end
end
