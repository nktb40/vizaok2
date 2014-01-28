ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	  :address        => 'smtp.gmail.com',
	  :port           => 587,
	  :domain         => 'cardsharp70@gmail.com',
	  :user_name      => 'cardsharp70',
	  :password       => 'YTREWQ7ep',
	  :authentication => 'plain',
     :enable_starttls_auto => true
}