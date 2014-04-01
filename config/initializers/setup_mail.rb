ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	  :address        => 'smtp.yandex.ru',
	  :port           => 25,
	  :domain         => 'help@vizaok.ru',
	  :user_name      => 'help@vizaok.ru',
	  :password       => '#YqMff95As',
	  :authentication => 'login',
     :enable_starttls_auto => true,
     :tls => true
}