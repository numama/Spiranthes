class QuestionsController < ApplicationController

  def index
    @questions = Question.new
  end

  def create
    
  end

  private
    def question_params
      params.require(:question).permit(:name, :body)
    end

end
