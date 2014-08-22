class Order < ActiveRecord::Base
	has_many :item
	validates :name, :phone, presence: true
	geocoded_by :user_ip,
  		:country => :user_country, :city => :user_city
	after_validation :geocode
end
