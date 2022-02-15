module Api 
  module V1
    class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]

    # GET /messages
    def index
        @messages = Messages.all

        render json: @messages
    end

    # GET /messages/1
    def show
        render json: @message
    end

    # POST create message
    def create
    @message = Message.new(message_params)

    if @message.after_save :
        render json: @message, status: created, location @message
    else
       render json: @message.errors, status :unproccessable_entity
    end

    # DELETE message
    def destroy
        @message.destroy
    end

    private  
    def message_params
        params.require(:plaintext, :key1, :output).permit(:key2, :output2, :user_id)
    end

    end
  end
end
end