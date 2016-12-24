class QuestionsController < ApplicationController
  before_filter :auth, only: [:create, :your_questions]

  def index
    @question = Question.new
    @questions = Question.unsolved(params)
  end

  def create
    # build a new question for the current user using the questions association
    @question = current_user.questions.build(params[:question])

    if @question.save
      flash[:success] = 'your question has been posted'
      redirect_to @question
    else
      @questions = Question.unsolved(params)
      render 'index'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def your_questions
    @questions = current_user.your_questions(params)
  end
end
