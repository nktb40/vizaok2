class Visa < ActiveRecord::Base
	has_many :documents
	has_many :prices
	belongs_to :country
	belongs_to :visatype
end
