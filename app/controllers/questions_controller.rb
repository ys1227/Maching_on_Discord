class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    
    @question = Question.find(params[:id])
    @question.destroy!

    redirect_to questions_path, status: :see_other
  end

  def create 
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
