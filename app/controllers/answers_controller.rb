class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params)
    @question.update(is_answered: true)
    redirect_to question_path(params[:question_id])
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    # 回答が一件もないときは未回答に変更
    @question.update(is_answered: false) unless @question.answers.present?
    redirect_to question_path(params[:question_id])
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
