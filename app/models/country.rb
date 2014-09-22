class Country < ActiveRecord::Base
	has_many :visas
	has_many :catalogs
end
