class UsersController < ApplicationController
  before_action :require_login, except: [:index,:new, :create, :login]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def create
    user = User.new(user_params)
    if user.save
      #user successfully saved in db
      #get user id
      session[:id] = User.find_by(email: user_params[:email]).id
      flash[:success] = "Account Created! You are now logged in"
      redirect_to "/users/#{session[:id]}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def new
  end

  def show
    #session[:id] doesn't exist unless user is authenticated at login
    @user = User.find(session[:id])
    @secrets = @user.secrets
    @secrets_liked = @user.secrets_liked

    
  end

  def destroy
  end

  def edit
    @user = User.find(session[:id])
  end

  def update

    @user = User.update(User.find(session[:id]),user_params)
    
    puts @user
    if @user.valid?

      flash[:success] = "Updated successfully in the system"
      redirect_to "/users/#{session[:id]}"
    else
      flash[:errors] = @user.errors.full_messages
      puts @user.errors.full_messages
      redirect_to "/users/#{session[:id]}/edit"
    end
  end

  def destroy
    User.destroy(session[:id])
    redirect_to "/sessions/new"
  end
  def login
    user1 = User.new(user_params)
    user = User.find_by(email: user_params[:email])
    #checks if email is correct and password matches the password in db
    if user.present? && user.authenticate(user_params[:password])
        flash[:success] = "Succesfully logged In"
        session[:id] = user.id
        redirect_to "/users/#{user.id}"
    else
      flash[:errors] = "Email/Password is Invalid"
      redirect_to '/sessions/new'
    end
  end
  def logout
    session[:id] = nil
    flash[:logout] = "You are logged out"
    redirect_to '/sessions/new'
  end

  private 
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end
end
