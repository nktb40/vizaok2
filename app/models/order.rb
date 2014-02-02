class Order < ActiveRecord::Base
	has_many :item
	validates :name, :phone, presence: true
end
