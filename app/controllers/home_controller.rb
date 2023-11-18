class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @questions = Question.includes(:topic).all
  end

  def profile
    @user_questions_count = current_user.questions.count
    @user_answers_count = current_user.answers.count
    @user_followings_count = current_user.followings.count
    @user_topics_count = current_user.topics.count
  end

  def question_list
    @questions = current_user.questions.includes(:topic)
  end

  def answer_list
    @answers = current_user.answers.includes(question: [:topic, :user])
  end

  def user_list
    @followings = current_user.followings
  end
  
  def topic_list
    @topics = current_user.topics
  end

end
