class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def create
    # The `params` object available in controllers
    # is composed of the query string, url params and the
    # body of a form (e.g. req.query + req.params + req.body)

    # A good trick to see if your routes work and you're getting
    # data that you want is rendering the params as JSON. This
    # is like doing res.send(req.body) in Express.
    # render json: params

    @question = Question.new question_params
    @question.user = current_user

    if @question.save
      redirect_to question_path(@question.id)
    else
      render :new
    end
  end

  def show
    @question.view_count += 1
    @question.save

    @answer = Answer.new
    @answers = @question.answers.order(created_at: :desc)
    # render :show
  end

  def index
    @questions = Question.order(created_at: :desc)
    # render json: @questions
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def authorize_user!
    unless can?(:manage, @question)
      flash[:danger] = "Access Denied"
      redirect_to question_path(@question)
    end
  end
end