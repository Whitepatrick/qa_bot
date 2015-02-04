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
=end

require 'xmpp4r/robot'

robot = Jabber::Robot.new('rundeck@chat.smartbrief.com', 'temp123!',
                          :auto_accept_subscription => true,)

p robot.start.roster

robot.notify_presence{ |from, status| put "#{from}" 'is' "#{status}"}

robot.notify_message do |from, body|
  if from == "pwhite@chat.smartbrief.com"
    puts "#{from} the creator says: #{body}"
  else
    puts "#{from}: from #{body}"
  end
end

robot.message('pwhite@chat.smartbrief.com', "you're a turkey")

rd, wr = IO.pipe
Signal.trap('INT'){ wr.puts }
rd.gets

robot.stop