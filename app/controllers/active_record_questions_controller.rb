class ActiveRecordQuestionsController < ApplicationController
  def show
    @active_record_question = ActiveRecordQuestion.find(params[:id])
    if params[:partial].present? && params[:target].present?
    turbo_response(frame: params[:target].gsub("_", "-"),partial: params[:partial], locals: { resource: @active_record_question, path: active_record_question_path(@active_record_question) })
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
    @active_record_questions = ActiveRecordQuestion.all.joins(:active_record_answer)
    #@active_record_answers = ActiveRecordAnswer.all
  end

  def edit
    @active_record_question = ActiveRecordQuestion.find(params[:id])
    @active_record_answer = @active_record_question.active_record_answer
  end

  def update
    @active_record_question = ActiveRecordQuestion.find(params[:id])
    return unless @active_record_question.update(active_record_question_params) && params[:commit] = "Submit"
    turbo_response(frame: 'edit-text-area', partial: 'generic_attribute', locals: {
      link_text: "Edit Question",
      generic_attribute_value: "#{@active_record_question.question_text}",
      target_path: active_record_question_path(@active_record_question, params: { target: :question_text, partial: :edit_text_area }),
      link_options: {
        data: {
          turbo_stream: "",
          locals: { resource: @active_record_question, path: active_record_question_path(@active_record_question) }
        }
      }
    })
  end


  private
  def active_record_question_params
    params.require(:active_record_question).permit(:question_text, active_record_answer_attributes: [:method, :example, :argumants])
  end
end
