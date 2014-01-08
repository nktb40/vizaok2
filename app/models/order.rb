class Order < ActiveRecord::Base
	has_many :item
	validates :name, :email, presence: true
end
