class QuestionsController < ApplicationController

  def index
    @questions = Question.all.limit(10)
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render 'index'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private
    def question_params
      params.require(:question).permit(:name, :body)
    end

end
