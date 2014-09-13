# encoding: utf-8
class VisasController < ApplicationController
	respond_to :html, :json, only: [:index, :show, :search]
	def index
		@visas = Visa.all
		@purposes = Purpose.all
		@countries = Country.all
		@order = Order.new
	end
	
	def show
		@visa = Visa.find(params[:id])
		@order = Order.new
		@visa_country = @visa.country.name
		@visa_type = @visa.name
		@purposes = Purpose.joins(:lnk_visa_purposes).where("lnk_visa_purposes.visa_id = ?", @visa.id)
		@migration_visas = LnkVisaPurpose.joins(:purpose).where("purposes.name = ?", "Иммиграция")
		if @purposes.map(&:name).include?("Иммиграция")
			@country_visas = Visa.where("country_id = ? and id in (?)", @visa.country_id, @migration_visas.map(&:visa_id)).order("visas.order")
		else			
			@country_visas = Visa.where("country_id = ? and id not in (?)", @visa.country_id, @migration_visas.map(&:visa_id)).order("visas.order")
		end		
		#@purposes = Purpose.joins("LEFT JOIN lnk_visa_purposes vp ON vp.purpose_id = purposes.id LEFT JOIN visas v ON vp.visa_id = v.id")
	end
	
	def visas_by_country
		@visas = Visa.joins(:country).where('countries.country_cd = ?', params[:country_cd]).order("visas.order").uniq
		@selected_country = Country.where('country_cd = ?', params[:country_cd]).first.id
		@selected_purpose = nil
		@purposes = Purpose.all
		@countries = Country.all	
		@current_country = params[:country_cd]
		@order = Order.new
		@visa_country = @selected_country.name
		render :index
	end
	
	
	def get_usa_visas
	   @migration_visas = LnkVisaPurpose.joins(:purpose).where("purposes.name = ?", "Иммиграция")
		@visas = Visa.joins(:country).where("countries.country_cd = ? and visas.id not in (?)", 'USA',@migration_visas.map(&:visa_id)).order("visas.order").uniq
		@selected_country = Country.where('country_cd = ?', 'USA').first
		@purposes = Purpose.joins("JOIN LNK_VISA_PURPOSES VP ON VP.purpose_id = purposes.id JOIN Visas on vp.visa_id = visas.id").where("visas.country_id = ?", @selected_country.id).uniq
		@countries = Country.all	
		@order = Order.new
		@visa_country = "США"
		render :index
	end
	
	def get_ca_visas
		@visas = Visa.joins(:country).where('countries.country_cd = ?', 'CA').order("visas.order").uniq
		@selected_country = Country.where('country_cd = ?', 'CA').first
		@purposes = Purpose.joins("JOIN LNK_VISA_PURPOSES VP ON VP.purpose_id = purposes.id JOIN Visas on vp.visa_id = visas.id").where("visas.country_id = ?", @selected_country.id).uniq
		@countries = Country.all	
		@order = Order.new
		@visa_country = "Канада"
		render :index	
	end
	
	def get_au_visas
		@migration_visas = LnkVisaPurpose.joins(:purpose).where("purposes.name = ?", "Иммиграция")
		@visas = Visa.joins(:country).where("countries.country_cd = ? and visas.id not in (?)", 'AU',@migration_visas.map(&:visa_id)).order("visas.order").uniq
		@selected_country = Country.where('country_cd = ?', 'AU').first
		@selected_purpose = nil
		@purposes = Purpose.joins("JOIN LNK_VISA_PURPOSES VP ON VP.purpose_id = purposes.id JOIN Visas on vp.visa_id = visas.id").where("visas.country_id = ?", @selected_country.id).uniq
		@countries = Country.all	
		@order = Order.new
		@visa_country = "Австралия"
		render :index	
	end
	
	def get_uk_visas
		@visas = Visa.joins(:country).where('countries.country_cd = ?', 'UK').order("visas.id").uniq
		@selected_country = Country.where('country_cd = ?', 'UK').first
		@purposes = Purpose.joins("JOIN LNK_VISA_PURPOSES VP ON VP.purpose_id = purposes.id JOIN Visas on vp.visa_id = visas.id").where("visas.country_id = ?", @selected_country.id).order("purposes.id").uniq
		@countries = Country.all	
		@order = Order.new
		@visa_country = "Великобритания"
		render :index	
	end
	
	def search
		if params[:purposes].blank? and !params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('visas.country_id = ?', params[:countries]).order("visas.order").uniq
			@selected_country = params[:countries]
			@visa_country = Country.find(params[:countries]).name
		elsif !params[:purposes].blank? and params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ?', params[:purposes]).order("visas.order")		
			@selected_purpose = params[:purposes]	
			@visa_purpose = Purpose.find(params[:purposes]).name
		elsif !params[:purposes].blank? and !params[:countries].blank?
			 @visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ? and visas.country_id = ?', params[:purposes], params[:countries]).order("visas.country_id, visas.order").uniq
			 @selected_country = params[:countries]
			 @selected_purpose = params[:purposes]		 
			 @visa_country = Country.find(params[:countries]).name
			 @visa_purpose = Purpose.find(params[:purposes]).name
	   else 		
	   	@visas = Visa.all.order("visas.country_id, visas.order").uniq
	   end
	end
	
   def start_search
   	if params[:countries] == 'USA' && params[:purposes] == "0"
   		redirect_to :action=>"get_usa_visas"
   	elsif params[:countries] == 'USA' && params[:purposes] == "1"
   		redirect_to :controller =>"pages", :action=>"usa_migration"
   	elsif params[:countries] == 'UK' && params[:purposes] == "0"
   		redirect_to :action=>"get_uk_visas"
   	elsif params[:countries] == 'CA' && params[:purposes] == "0"
   		redirect_to :action=>"get_ca_visas"
      elsif params[:countries] == 'CA' && params[:purposes] == "1"
   		redirect_to :controller =>"pages", :action=>"ca_migration"
   	elsif params[:countries] == 'AU' && params[:purposes] == "0"
   		redirect_to :action=>"get_au_visas"
   	elsif params[:countries] == 'AU' && params[:purposes] == "1"
   		redirect_to :controller =>"pages", :action=>"au_migration"
   	end
   end	
	
	def start_search1
	   if params[:purposes].blank? and !params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('visas.country_id = ?', params[:countries]).order("visas.name").uniq	
			@selected_country = Country.find(params[:countries])		
			@visa_country = Country.find(params[:countries]).name
		elsif !params[:purposes].blank? and params[:countries].blank?
			@visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ?', params[:purposes]).order("visas.country_id, visas.name")		
			@selected_purpose = params[:purposes]		
			@visa_purpose = Purpose.find(params[:purposes]).name
		elsif !params[:purposes].blank? and !params[:countries].blank?
			 @visas = Visa.joins("LEFT JOIN lnk_visa_purposes vp ON vp.visa_id = visas.id").where('vp.purpose_id = ? and visas.country_id = ?', params[:purposes], params[:countries]).order("visas.country_id, visas.name").uniq
			 @selected_country = Country.find(params[:countries])	
			 @selected_purpose = params[:purposes]	   
			 @visa_country = Country.find(params[:countries]).name
			 @visa_purpose = Purpose.find(params[:purposes]).name
	   else 		
	   	@visas = Visa.all.order("visas.country_id, visas.name").uniq
	   end
		@purposes = Purpose.all
		@countries = Country.all	
		@order = Order.new	
		render :index
	end
end

