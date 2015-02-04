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
require_relative 'vars'

robot = Jabber::Robot.new(USERNAME, PASSWORD,
                          :auto_accept_subscription => true,)
p robot.start.roster
robot.notify_presence{ |from, status| put "#{from}" 'is' "#{status}"}


robot.notify_message do |from, body|
  command = Array.new(body.split(' '))
  if command[0] == "dispatch"
    dispatch(command, from)
  elsif command[0] == "build"
    run(command, from)
  end
end

def dispatch(command, from)
  send_message(from, command)
  puts command
  puts from
end

def run(command, from)
  send_message(from, command)
  puts command
  puts from
end

def send_message(command, from)
  puts command
  puts from
end

rd, wr = IO.pipe
Signal.trap('INT'){ wr.puts }
rd.gets

robot.stop