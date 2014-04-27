# encoding: utf-8
class ProductsController < ApplicationController
	include OrdersHelper
	def index
		@order = Order.new
		@question = Question.new
		@visa_country = 'США'
	end
	
	def usa_visa
		@order = Order.new
		@question = Question.new
		@visa_country = 'США'
	end
	
	def uk_visa
		@order = Order.new
		@question = Question.new
		@visa_country = 'Великобритания'
	end
		
	def download_turist_doc
	  send_file(
	    "#{Rails.root}/public/documents/Анкета DS-160(Туристическая).docx",
	    filename: "Анкета DS-160 (Туристическая/деловая).docx",
	    type: "application/docx"
	  )
	end
	
	def download_student_doc
	  send_file(
	    "#{Rails.root}/public/documents/Анкета DS-160 (Студенческая).docx",
	    filename: "Анкета DS-160 (Студенческая виза).docx",
	    type: "application/docx"
	  )
	end
	
	def download_work_doc
	  send_file(
	    "#{Rails.root}/public/documents/Анкета DS-160 (Рабочая виза).docx",
	    filename: "Анкета DS-160 (Рабочая виза).docx",
	    type: "application/docx"
	  )
	end
	
	def download_turist_uk_doc
	  send_file(
	    "#{Rails.root}/public/documents/anketa_turizm.doc",
	    filename: "Анкета для туристической визы.doc",
	    type: "application/doc"
	  )
	end
	
	def download_student_uk_doc
	  send_file(
	    "#{Rails.root}/public/documents/anketa_student.doc",
	    filename: "Анкета для студенческой визы.doc",
	    type: "application/doc"
	  )
	end
	
	def download_biznes_uk_doc
	  send_file(
	    "#{Rails.root}/public/documents/anketa_biznes.doc",
	    filename: "Анкета для бизнес визы.doc",
	    type: "application/doc"
	  )
	end
	
end
