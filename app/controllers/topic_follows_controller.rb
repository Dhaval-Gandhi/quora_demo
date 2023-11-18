class TopicFollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_question

  def create
    @topic_follow = TopicFollow.new(user: current_user, topic: @question.topic)

    if @topic_follow.save
      flash.notice = "Successfully follow topic #{@question.topic.name}"
    else
      flash.alert = @topic_follow.errors.full_messages.join
    end
    redirect_to question_path(id: @question.id) and return
  end

  private

  def fetch_question
    @question = Question.find_by_id(params[:question_id])
    redirect_to root_path unless @question.present?
  end
end
