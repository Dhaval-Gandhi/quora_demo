class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :fetch_question, only: [:show]

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.topic = fetch_topic
    @question.user = current_user

    if @question.save
      flash.notice = "Question post successfully."
      redirect_to root_path
    else
      flash.alert = @question.errors.full_messages.join
      render :new
    end

  end

  private

  def question_params
    params.permit(:content)
  end

  def fetch_question
    @question = Question.includes(:answers, :user, :topic).find_by_id(params[:id])
    redirect_to root_path unless @question.present?
  end

  def fetch_topic
    @topic = Topic.find_or_create_by(name: params[:topic_name])
  end

end
