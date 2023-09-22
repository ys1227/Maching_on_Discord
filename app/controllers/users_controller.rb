class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: %i[new create]

  # GET /users or /users.json
  

  # GET /users/1 or /users/1.json
  

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to questions_path, success: '新規登録に成功しました'
    else
      flash.new[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  

  # DELETE /users/1 or /users/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
