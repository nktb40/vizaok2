class Visa < ActiveRecord::Base
	has_many :documents
	has_many :prices
	has_many :addinfos
	has_many :links
	has_many :lnk_visa_purposes
	belongs_to :country
	belongs_to :subtype
	
	extend FriendlyId
	friendly_id :visa_cd, use: [:slugged, :finders]
end
