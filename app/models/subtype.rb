class Subtype < ActiveRecord::Base
	belongs_to :visatype
	has_many :visas
	def self.migration(param)
    joins(:visatype).where("migration < ?", param)
   end
end
