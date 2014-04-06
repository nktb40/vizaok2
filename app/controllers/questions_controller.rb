class QuestionsController < ApplicationController

  def create
  	@question = Question.new(question_params)
  	@question.user_ip = request.env["HTTP_X_FORWARDED_FOR"]
  	if(@question.save)
  	      QuestionMailerWorker.perform_async(@question.id)
			logger.info "question saving success"
		else
			logger.info "question error when saving"
		end
  end
  
  def question_params 
  		params.require(:question).permit(:name, :email, :phone, :question, 
  		:user_ip, :visa_country)  
  end 
end
