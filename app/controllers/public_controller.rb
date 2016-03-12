class PublicController < ApplicationController
	def index
		@message = Message.new
	end
	def create
		@message = Message.new params[:message]
		@message.request = request
		if @message.deliver	
			flash[:notice] = "Message has been sent!"
		else
			flash[:notice] = "Cannot send message :("
		end
		respond_to do |format|
			format.js { flash[:notice] }
		end
	end
end
