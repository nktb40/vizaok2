class Question < ActiveRecord::Base
	validates :name, :email, :question, presence: true
end
