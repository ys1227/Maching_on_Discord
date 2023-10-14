class RoomsController < ApplicationController
  skip_before_action :require_login,only: %i[show]
  def show
    @messages = Message.all
    @question = Question.find(params[:id])
  end
end
