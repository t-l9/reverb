App.teams = App.cable.subscriptions.create "TeamsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log data
    activeTeam = $("[data-behavior='messages'][data-team-id='#{data.team_id}']")

    if activeTeam.length > 0
      activeTeam.append(data.message)
    else
      $("[data-behavior='team-link'][data-team-id='#{data.team_id}']").css('font-weight', 'bold');
