class PagesController < ApplicationController
	def index
		@countries = Country.all
		@purposes = Purpose.all
	end
end
