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


	def create

	    # Create and save new message from data received from the client
	    new_message = Message.new
	    new_message.author_name = params[:new_message][:author_name][0...250] # Get only first 250 characters
	    new_message.contents = params[:new_message][:contents]

	    # Confirm message is valid and save or return HTTP error
	    if new_message.valid?
	      new_message.save!
	    else
	      render "public/422", :status => 422
	      return
	    end

	    # Respond with newly created message in json format
	    respond_with(new_message) do |format|
	      format.json { render :json => new_message.as_json }
	    end

	end
end
