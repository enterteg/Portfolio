class PublicController < ApplicationController
	def index
		@message = Message.new
	end
	def create
		@message = Message.new params[:message]
		@message.request = request
		if @message.deliver	
			flash.now[:error] = nil
		else
			flash.now[:error] = 'Cannot send message, little gnomes had to broke something!'
			render.new
		end
	end
end
