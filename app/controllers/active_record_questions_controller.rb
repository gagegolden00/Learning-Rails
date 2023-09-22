class ActiveRecordQuestionsController < ApplicationController
  def show; end

  def create
    @active_record_question = ActiveRecordQuestion.new(active_record_question_params)
    if @active_record_question.save
      redirect_to active_record_questions_path
    else
      render :new
    end
  end

  def new
    @active_record_question = ActiveRecordQuestion.new
    @active_record_answer = ActiveRecordAnswer.new
  end

  def index
    @active_record_questions = ActiveRecordQuestion.all
    @active_record_answers = ActiveRecordAnswer.all
  end


  private
  def active_record_question_params
    params.require(:active_record_question).permit(:question, active_record_answer_attributes: [:method, :description])
  end
end
