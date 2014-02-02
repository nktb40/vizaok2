# encoding: utf-8
class QuestionMailer < ActionMailer::Base
	def send_question(question)
		@question = question
		email = "nktb40@gmail.com"
		mail :to =>  email, :from => "CARDSHARP", :subject => "Вопрос от #{question.email}"
	end
end
