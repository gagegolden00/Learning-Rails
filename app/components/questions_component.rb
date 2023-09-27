# frozen_string_literal: true

class QuestionsComponent < ApplicationComponent
  def initialize(question:)
    @question = question
  end
end
