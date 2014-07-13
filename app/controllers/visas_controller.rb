class VisasController < ApplicationController
	respond_to :html, :json, only: [:index, :show, :search]
	def index
		@visas = Visa.all
		@purposes = Purpose.all
		@countries = Country.all
	end
	
	def show
		@visa = Visa.find(params[:id])
		@purposes = Purpose.joins(:lnk_visa_purposes).where("lnk_visa_purposes.visa_id = ?", @visa.id)
	end
	
	def search
		if params[:purposes].blank? and !params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('visas.country_id = ?', params[:countries]).uniq
		elsif !params[:purposes].blank? and params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ?', params[:purposes])		
		elsif !params[:purposes].blank? and !params[:countries].blank?
			 @visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ? and visas.country_id = ?', params[:purposes], params[:countries])
	   else 		
	   	@visas = Visa.all
	   end
	end
	
	def start_search
	   if params[:purposes].blank? and !params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('visas.country_id = ?', params[:countries])	
		elsif !params[:purposes].blank? and params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ?', params[:purposes])		
		elsif !params[:purposes].blank? and !params[:countries].blank?
			 @visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ? and visas.country_id = ?', params[:purposes], params[:countries])
	   else 		
	   	@visas = Visa.all
	   end
		@purposes = Purpose.all
		@countries = Country.all		
		render :index
	end
end

