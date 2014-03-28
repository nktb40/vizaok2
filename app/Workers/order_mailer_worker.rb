class OrderMailerWorker
  include Sidekiq::Worker
  
  def perform(order_id, remote_ip)
  	   @order = Order.find(order_id)
  	   @ip = remote_ip
    	OrderMailer.send_order_delivery(@order,"help@vizaok.ru", @ip).deliver
	 	OrderMailer.send_order_delivery(@order,"nktb40@gmail.com", @ip).deliver
  end
end