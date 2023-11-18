class UserFollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_question

  def create
    if @question.user.id == current_user.id
      flash.alert = "You can not follow yourself."
      redirect_to question_path(id: @question.id) and return
    end

    @user_follow = UserFollow.new(user: current_user, following: @question.user)

    if @user_follow.save
      flash.notice = "Successfully follow user #{@question.user.email}"
    else
      flash.alert = @user_follow.errors.full_messages.join
    end
    redirect_to question_path(id: @question.id) and return
  end

  private

  def fetch_question
    @question = Question.find_by_id(params[:question_id])
    redirect_to root_path unless @question.present?
  end
end
