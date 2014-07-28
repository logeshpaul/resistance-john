class MessagesController < ApplicationController
	respond_to :json

	def index

	# Gather all message data
	messages = Message.all

	# Respond to request with message data in json format
	respond_with(messages) do |format|
	  format.json { render :json => messages.as_json }
	end

	end
end
