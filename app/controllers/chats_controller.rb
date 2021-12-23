class ChatsController < ApplicationController
    before_action :authorized

    def index
        data = Chat.all()
        if data.present?
            render json:{data:data, status:"ok"},status: :ok
        else
            render json:{message:"unavailable data"},status: :not_found
        end
    end

    def create
        params[:user_id] = @user.id
        data = Chat.create(chat_params)
        if data.valid?
            data.save
            render json:{message:"success"},status: :created
        else
            render json:{message:"failed"},status: :bad_request
        end
    end

    private
    def chat_params
        params.permit(:content, :seen, :user_id)
    end
end
