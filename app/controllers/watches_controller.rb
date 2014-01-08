class WatchesController < ApplicationController
	include OrdersHelper
	def index
		@watches = Watch.all
		if !user_cookie_exists?
			set_user_cookie 
		end	 	
		@order_number = load_user_cookie_data.size
	end
end
