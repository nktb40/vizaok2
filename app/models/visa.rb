class Visa < ActiveRecord::Base
	has_many :documents
	has_many :prices
	has_many :addinfos
	has_many :links
	has_many :lnk_visa_purposes
	has_many :procedures
	belongs_to :country
	belongs_to :subtype
	belongs_to :catalog
	
	extend FriendlyId
	friendly_id :translit, use: [:slugged, :finders]
end
