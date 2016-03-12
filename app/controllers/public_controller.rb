class PublicController < ApplicationController
	def index
		@message = Message.new
	end
	def create
		@message = Message.new params[:message]
		@message.request = request
		if @message.deliver	
			@send = true
			flash[:notice] = "Message has been sent!"
		else
			flash[:notice] = "Cannot send message, did you fill out everything?"
			@send = false
		end
		respond_to do |format|
			format.html { redirect_to :index }
			format.js { flash[:notice] }
		end
	end
end
