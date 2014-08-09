# encoding: utf-8
class VisasController < ApplicationController
	respond_to :html, :json, only: [:index, :show, :search]
	def index
		@visas = Visa.all
		@purposes = Purpose.all
		@countries = Country.all
		@selected_country = nil
		@selected_purpose = nil
	end
	
	def show
		@visa = Visa.find(params[:id])
		@countries = Country.all
		#@purposes = Purpose.joins("LEFT JOIN lnk_visa_purposes vp ON vp.purpose_id = purposes.id LEFT JOIN visas v ON vp.visa_id = v.id")
		@purposes = Purpose.joins(:lnk_visa_purposes)
		#@purposes = Purpose.joins(:lnk_visa_purposes).where("lnk_visa_purposes.visa_id = ?", @visa.id)
	end
	
	def visas_by_country
		@visas = Visa.joins(:country).where('countries.country_cd = ?', params[:country_cd]).order("visas.name").uniq
		@selected_country = Country.where('country_cd = ?', params[:country_cd]).first.id
		@selected_purpose = nil
		@purposes = Purpose.all
		@countries = Country.all	
		@current_country = params[:country_cd]
		render :index
	end
	
	
	def get_usa_visas
		@visas = Visa.joins(:country).where('countries.country_cd = ?', 'USA').order("visas.name").uniq
		@selected_country = Country.where('country_cd = ?', 'USA').first.id
		@selected_purpose = nil
		@purposes = Purpose.all
		@countries = Country.all	
		render :index
	end
	
	def get_ca_visas
		@visas = Visa.joins(:country).where('countries.country_cd = ?', 'CA').order("visas.name").uniq
		@selected_country = Country.where('country_cd = ?', 'CA').first.id
		@selected_purpose = nil
		@purposes = Purpose.all
		@countries = Country.all	
		render :index	
	end
	
	def get_au_visas
		@visas = Visa.joins(:country).where('countries.country_cd = ?', 'AU').order("visas.name").uniq
		@selected_country = Country.where('country_cd = ?', 'AU').first.id
		@selected_purpose = nil
		@purposes = Purpose.all
		@countries = Country.all	
		render :index	
	end
	
	def get_uk_visas
		@visas = Visa.joins(:country).where('countries.country_cd = ?', 'UK').order("visas.name").uniq
		@selected_country = Country.where('country_cd = ?', 'UK').first.id
		@selected_purpose = nil
		@purposes = Purpose.all
		@countries = Country.all	
		render :index	
	end
	
	def search
		if params[:purposes].blank? and !params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('visas.country_id = ?', params[:countries]).uniq
			@selected_country = params[:countries]
		elsif !params[:purposes].blank? and params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ?', params[:purposes])		
			@selected_purpose = params[:purposes]		
		elsif !params[:purposes].blank? and !params[:countries].blank?
			 @visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ? and visas.country_id = ?', params[:purposes], params[:countries])
			 @selected_country = params[:countries]
			 @selected_purpose = params[:purposes]		   
	   else 		
	   	@visas = Visa.all
	   end
	end
	
	def start_search
	   if params[:purposes].blank? and !params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('visas.country_id = ?', params[:countries])	
			@selected_country = params[:countries]		
		elsif !params[:purposes].blank? and params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ?', params[:purposes])		
			@selected_purpose = params[:purposes]		
		elsif !params[:purposes].blank? and !params[:countries].blank?
			 @visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ? and visas.country_id = ?', params[:purposes], params[:countries])
			 @selected_country = params[:countries]
			 @selected_purpose = params[:purposes]	   
	   else 		
	   	@visas = Visa.all
	   	@selected_country = nil
			@selected_purpose = nil
	   end
	   @visas = @visas.joins(:country).order("countries.name, visas.name")
		@purposes = Purpose.all
		@countries = Country.all		
		render :index
	end
end

