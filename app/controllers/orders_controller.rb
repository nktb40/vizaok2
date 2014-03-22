# encoding: utf-8
class OrdersController < ApplicationController
	include OrdersHelper
	
	def index
		@order_number = 0
	end
	
	def new
		@order = Order.new
	end
	
	def create
		@order = Order.new(order_params)
		if(@order.save)
			OrderMailerWorker.perform_async(@order.id)
			logger.info "saving success"
		else
			logger.info "error when saving"
		end
		
	end
	
	def add_product 
	   if !user_cookie_exists?
			set_user_cookie 
		end	 	
	 	add_to_user_cookie(params[:product_id])
	 			
		current = load_user_cookie_data
		@order_number = 0
		current.each do |c|
			@order_number += c["quantity"]
		end
	end
	
	def remove_product
		remove_from_user_cookie(params[:id]) unless user_cookie_exists?
	end
	
	def show_cart
	   ids = []
		@items = load_user_cookie_data
		@items.each do |i|
			ids << i["id"]
		end
		@products = Product.find_all_by_id(ids)
		@order = Order.new
	end
	
	def test
		if !user_cookie_exists? 
			set_user_cookie 
		end	 	
	 	add_to_user_cookie(params[:id])
	end
	
	private 
 	def order_params 
  		params.require(:order).permit(:name, :email, :phone, :address)  
 	end 
end
