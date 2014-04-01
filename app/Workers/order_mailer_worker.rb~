class OrderMailerWorker
  include Sidekiq::Worker
  
  def perform(order_id, remote_ip, city)
  	   @order = Order.find(order_id)
  	   @ip = remote_ip
  	   @city = city
    	OrderMailer.send_order_delivery(@order,"help@vizaok.ru", @ip, @city).deliver
	 	OrderMailer.send_order_delivery(@order,"nktb40@gmail.com", @ip, @city).deliver
  end
end