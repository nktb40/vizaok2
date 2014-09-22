class Catalog < ActiveRecord::Base
	has_many :visas
	belongs_to :country
	
	extend FriendlyId
	friendly_id :translit, use: [:slugged, :finders]
end
