class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_team

    def create
        message = @team.messages.new(message_params)
        message.user = current_user

        message.save
        redirect_to @team
    end

    private

        def set_team
            @team = Team.find(params[:team_id])
        end

        def message_params
            params.require(:message).permit(:body)
        end
end
