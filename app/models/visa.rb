class Visa < ActiveRecord::Base
	has_many :documents
	has_many :prices
	has_many :addinfos
	has_many :links
	belongs_to :country
	belongs_to :subtype
end
