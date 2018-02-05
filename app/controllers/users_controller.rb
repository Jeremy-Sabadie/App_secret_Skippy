class UsersController < ApplicationController
  def home
    
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @titre = "Inscription"
  end

  def show
    @users = User.find(params[:id])
  end

  def create
    @users = User.create(users_params)
    if @users.save
      log_in @users
      flash[:success] = "Bienvenu vers une totale pensée cosmique vers un nouvel age réminiscent"
      redirect_to @users
    else 
      render 'new'
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @users.update(params.require(:users).permit(:email))
       redirect_to @users
    else
      render 'new'
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to users_path
  end

  private

  def users_params
      params.require(:user).permit(:email, :password)
    end

end
