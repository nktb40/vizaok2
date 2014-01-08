class ProductsController < ApplicationController
	include OrdersHelper
	def index
		@products = Product.all
		if !user_cookie_exists?
			set_user_cookie 
		end	 	
		current = load_user_cookie_data
		@order_number = 0
		current.each do |c|
			@order_number += c["quantity"]
		end
	end
end
