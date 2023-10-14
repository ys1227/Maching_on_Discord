class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      cookies.encrypted[:user_id] = @user.id
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    cookies.delete(:user_id)
    redirect_to root_path, status: :see_other, danger: 'ログアウトしました'
  end
end