#!/usr/bin/env ruby
# bot.rb
# Module to act as main interface for bot
# By: Patrick White

=begin
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
=end

require 'xmpp4r'
require_relative 'connect'
require_relative 'alert'
require_relative 'exec'
require_relative 'listen'
require_relative 'query'
require_relative 'speak'

test_method("This should appear")

