class ActiveRecordQuestionsController < ApplicationController
  def show
    @active_record_question = ActiveRecordQuestion.find(params[:id])
    # turbo edits on the show page
    return unless params[:partial].present? && params[:target].present?
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          params[:target].gsub("_", "-"),
          partial: "shared/#{params[:partial]}",
          locals: {resource: @active_record_question, path: active_record_question_path(@active_record_question)}
        )
      end
      format.html
    end
  end

  def create
    @active_record_question = ActiveRecordQuestion.new(active_record_question_params)
    if @active_record_question.save
      redirect_to active_record_question_path(@active_record_question)
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

  def edit
    @active_record_question = ActiveRecordQuestion.find(params[:id])
    @active_record_answer = @active_record_question.active_record_answer
  end

  def update
    @active_record_question = ActiveRecordQuestion.find(params[:id])
    if @active_record_question.update(active_record_question_params)
      redirect_to active_record_questions_path
    else
      render :edit
    end
  end


  private
  def active_record_question_params
    params.require(:active_record_question).permit(:question_text, active_record_answer_attributes: [:method, :example, :argumants])
  end
end
