class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :show]
  
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.order(id: :desc).page(params[:page])
    counts(@user)
  end
  
  def edit 
    @user=User.find(params[:id])
  end 
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを変更しました"
      redirect_to tasks_path
    else 
      flash[:danger] = "プロフィールを変更できませんでした。"
      render :edit
    end 
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
