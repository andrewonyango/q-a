class QuestionsController < ApplicationController
  before_filter :auth, only: [:create]

  def index
    @question = Question.new
  end

  def create
    # build a new question for the current user using the questions association
    @question = current_user.questions.build(params[:question])

    if @question.save
      flash[:success] = 'your question has been posted'
      redirect_to root_url
    else
      render 'index'
    end
  end
end
