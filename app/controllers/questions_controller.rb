class QuestionsController < ApplicationController

  def index
    # 管理者はすべての投稿を、ユーザは回答済みの投稿を表示
    if logged_in?
      @questions = Question.limit(128).order(id: "DESC")
    else
      @questions = Question.where(is_answered: true).order(id: "DESC").limit(10)
    end
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      @questions = []
      render 'index'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:name, :body)
    end

end
