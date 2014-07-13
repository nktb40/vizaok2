class LnkVisaPurpose < ActiveRecord::Base
	belongs_to :visa
	belongs_to :purpose
end
