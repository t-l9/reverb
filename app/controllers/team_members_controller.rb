class TeamMembersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_team

    def create
        @team_member = @team.team_members.where(user_id: current_user.id).first_or_create
        redirect_to @team
    end

    def destroy
        @team_member = @team.team_members.where(user_id: current_user.id).destroy_all
        redirect_to teams_path
    end

    private

        def set_team
            @team = Team.find(params[:team_id])
        end
end
