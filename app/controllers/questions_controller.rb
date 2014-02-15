class QuestionsController < ApplicationController

  def create
  	@question = Question.new(question_params)
  	if(@question.save)
  			QuestionMailer.send_question(@question, "help@vizaok.ru").deliver
			QuestionMailer.send_question(@question, "nktb40@gmail.com").deliver
			logger.info "question saving success"
		else
			logger.info "question error when saving"
		end
  end
  
  def question_params 
  		params.require(:question).permit(:name, :email, :phone, :question)  
  end 
end
