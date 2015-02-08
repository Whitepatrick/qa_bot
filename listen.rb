#!/usr/bin/env ruby
# listen.rb
# Module to receive input and do an action
# By: Patrick White

=begin
  This module will serve as the input center for users
  to instruct the bot to execute an action or to request
  information from the bot

  Listening should lead to an action:
    - Send to query.rb: find a thing out
    - Send to exec.rb: do a thing
    - Send to speak.rb: say a thing
    - Send to alert.rb: inform user of a thing
=end

require 'rspec'
require 'xmpp4r'
require 'xmpp4r/robot'
require_relative 'client'

class Listen
  def sanatize(message)
    puts message
  end
end

