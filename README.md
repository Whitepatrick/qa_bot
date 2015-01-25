qa_bot
======================================================
QA Jabber Bot

bot.rb
======================================================
This module will serve as the UI for this
  bot.

  Execution:
  ruby bot.rb start

    - Imports all modules
    - Create sustained connection ("Bot Alive")
    - Call listen mode by default
      - can accept params to pass info to other modules
    - Receive Kill / Restart commands
      - Kill connection
      - Save state
      - Restart script for Restart


connect.rb
======================================================
This module will serve as a connection proxy
  for all the bot's functions. Should try attaching
  to globals.conf for username and password in
  an effort to keep credentials out of this project

  Needs to:
    - Make connection
    - Destroy connection
    - Check connection
    - Load users/chat rooms


listen.rb
======================================================
This module will serve as the input center for users
  to instruct the bot to execute an action or to request
  information from the bot

  Listening should lead to an action:
    - Send to query.rb: find a thing out
    - Send to exec.rb: do a thing
    - Send to speak.rb: say a thing
    - Send to alert.rb: inform user of a thing

speak.rb
======================================================
This module will serve as a method of outward
  communication

  This should connect and message either a user
  or a chat room with information.
    - Get info from query/exec
    - Decide target audience
    - Send message
      - Return to listen mode


  The information should arrive un-sanitized, so
  sanitizing the outgoing message should depend
  on where it's going
    - All caps
    - All lower
    - Mix

exec.rb
======================================================
This module will serve as an executioner of
  commands received from the listen module or
  alert module

  Should return stdout & stderr to speak module
    - Receive parameters for execution
    - Construct command based on params
    - Set destination based on params
    - Execute
    - Return status or exit

alert.rb
======================================================
This module will serve as a signal processor that
  alerts a user, users, or user entity of an event or
  status. These can be expected alerts (rundeck finish),
  or un-expected (rundeck fail using error handling).

  Should work on integration with system calls & procs
  to give live data on servers if errors happens
    - Tie in to ELK / statsd / Graphite
