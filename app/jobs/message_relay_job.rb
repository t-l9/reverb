class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "teams:#{message.team.id}",
      message: MessagesController.render(message),
      team_id: message.team.id
  end
end
