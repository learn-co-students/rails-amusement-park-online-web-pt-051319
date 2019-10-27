class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def edit
  end

  def new
    @user = User.new
  end

  def create
    if params[:admin]
      @user = User.create(admin_params)
    else
      @user = User.create(user_params)
    end

    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end 

  def show
    @user = User.find_by(:id => params[:id])

    if !current_user.admin
      if current_user != @user
          redirect_to root_path
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def admin_params
    params.require(:user).permit(:name, :password, :admin)
  end
end
