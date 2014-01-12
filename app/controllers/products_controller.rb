class ProductsController < ApplicationController
	include OrdersHelper
	def index
		@order = Order.new
		@question = Question.new
	end
end
