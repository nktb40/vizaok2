# encoding: utf-8
class PagesController < ApplicationController
	def index
		@countries = Country.all
		@purposes = Purpose.all
		@visas_usa = Visa.joins("LEFT JOIN countries c ON c.id = visas.country_id").where("c.country_cd = ?", "USA")
		@visas_uk = Visa.joins("LEFT JOIN countries c ON c.id = visas.country_id").where("c.country_cd = ?", "UK")
		@visas_ca = Visa.joins("LEFT JOIN countries c ON c.id = visas.country_id").where("c.country_cd = ?", "CA")
		@visas_au = Visa.joins("LEFT JOIN countries c ON c.id = visas.country_id").where("c.country_cd = ?", "AU")
	end
	
	def usa_migration
		@order = Order.new
		@visa_country = "США"
		@visa_purpose = "Иммиграция"
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id LEFT JOIN countries c ON c.id = visas.country_id").where("p.name = ? and c.name = ?", "Иммиграция", "США")
	end
	
	def au_migration
		@order = Order.new
		@visa_country = "Австралия"
		@visa_purpose = "Иммиграция"
		@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id LEFT JOIN purposes p ON p.id = vp.purpose_id LEFT JOIN countries c ON c.id = visas.country_id").where("p.name = ? and c.name = ?", "Иммиграция", "Австралия")
	end
end
