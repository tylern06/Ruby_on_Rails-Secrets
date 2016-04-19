class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @secrets = Secret.all
    # get all secrets liked by current user and return as an array
    @secrets_likes = User.find(session[:id]).likes.pluck(:secret_id)

  end

  def create
  	secret = Secret.new(user: User.find(session[:id]), content: secret_params[:content])

    if !secret.save  
      flash[:errors] = secret.errors.full_messages 
    end
  	redirect_to "/users/#{session[:id]}" 
  end

  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to :back
  end
  private 

  def secret_params
    params.require(:secret).permit(:content)
  end

end
    
