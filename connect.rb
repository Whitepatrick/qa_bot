#!/usr/bin/env ruby
# connect.rb
# Module to handle connections made between bot
# and SB jabber server
# By: Patrick White


=begin
  This module will serve as a connection proxy
  for all the bot's functions. Should try attaching
  to globals.conf for username and password in
  an effort to keep credentials out of this project

  Needs to:
    - Make connection
    - Destroy connection
    - Check connection
    - Load users/chat rooms
    - Kill / Restart commands
=end
