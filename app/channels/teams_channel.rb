# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class TeamsChannel < ApplicationCable::Channel
  def subscribed
    current_user.teams.each do |team|
      stream_from "teams:#{team.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
