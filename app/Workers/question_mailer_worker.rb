class QuestionMailerWorker
  include Sidekiq::Worker
  
  def perform(question_id)
  	   @question = Question.find(question_id)
  			QuestionMailer.send_question(@question, "help@vizaok.ru").deliver
			QuestionMailer.send_question(@question, "nktb40@gmail.com").deliver
  end
end