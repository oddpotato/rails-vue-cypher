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
    end
  end
end
end