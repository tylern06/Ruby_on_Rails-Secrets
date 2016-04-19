class LikesController < ApplicationController
	
	def add
		#select a liks where secret_id and user_id matches who liked the secret_id
		like = Like.find_by(secret_id: params[:secret_id],user_id: session[:id])
		puts like.inspect
	
		puts "%%%%%%%%%%%%"
		puts session[:id]

		#checks if the like has been already liked by the current_user
		if !(like.present? && like.user_id == session[:id])
			#likes the secret if there are no likes on it by the current_user
			Like.create(secret_id: params[:secret_id],user_id: session[:id])
		end
		# puts params[:secret_id]
		redirect_to "/secrets"
	end

	def remove

		like = Like.find_by(secret_id: params[:secret_id], user_id: session[:id])
		
		#deletes the likes if it finds a matching secret_id with current_user
		if like.present? && like.user_id == session[:id]
			like.destroy
		end
		redirect_to "/secrets"
	end
end
