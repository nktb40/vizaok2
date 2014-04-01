# encoding: utf-8
class OrderMailer < ActionMailer::Base
	def send_order_delivery(order, email, ip, city)
		@order = order
		@ip = ip
		@city = city
		mail :to =>  email, :from => "help@vizaok.ru", :subject => "Заявка №#{order.id}, от #{order.email}"
	end
	
	def send_order_customer(order)
		@order = order
		mail :to =>  @order.email, :from => "vizaOK", :subject => "Заявка vizaOK №#{order.id}"
	end
end
