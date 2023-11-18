class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_question, only: [:new, :create]

  def new
    @answer = Answer.new(user: current_user, question_id: params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    if @answer.save
      flash.notice = "Answer post successfully."
      redirect_to question_path(id: @question.id)
    else
      flash.alert = @answer.errors.full_messages.join
      render :new
    end
  end

  private

  def answer_params
    params.permit(:question_id, :content)
  end

  def fetch_question
    @question = Question.find_by_id(params[:question_id])
    redirect_to root_path unless @question.present?
  end
end
