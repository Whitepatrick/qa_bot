#!/usr/bin/env ruby
# client.rb
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

=begin
use classes and class inheritance to work around robot not working for methods.
=end

require 'xmpp4r/robot'
require_relative 'vars'
require_relative 'listen'

class Robot

  # Method to connect bot to server and begin
  # listening for messages. Later functionality
  # will include joing MUC.
  def connect_and_listen
    # calls xmpp4r-robot instance w/ connection
    conn = Jabber::Robot.new(USERNAME, PASSWORD,
                             :auto_accept_subscription => true,)
    # starts bot
    conn.start.roster

    # takes incoming messages, stores them lowercase
    # and sends to transform method for further
    # assignments
    conn.notify_message do | from, body |
      from.downcase!
      body.downcase!
      transform(from, body)
    end

    # Opens a stream to listen to
    # quits when interrupt is received
    rd, wr = IO.pipe
    Signal.trap('INT'){ wr.puts }
    rd.gets

    # stops bot
    conn.stop
  end

  # order of array SHOULD be:
  # arr[0] = verb
  # arr[1] = target
  # arr[2] = repo
  # arr[3] = branch

  # takes data passed from connect_and_listen
  # and stores them in hashes.
  #
  # message contains both original message body
  # and sender address (JID)
  #
  # cmd contains the message body broken down
  # and stored in to a hash. As of right now
  # it blindly stores the values to a key based
  # on how the cmd is entered by the user. In
  # the case where a malformed command is entered
  # this will barf. Error handling should be the
  # the next step here.
  def transform(from, body)

    message = Hash.new{|h,k| h[k] = 0 }
    message[:from] = from
    message[:cmd] = body

    cmd = Hash.new{|h,k| h[k] = 0 }
    cmd_split = body.split
    cmd[:verb] = cmd_split[0]
    cmd[:target] = cmd_split[1]
    cmd[:repo] = cmd_split[2]
    cmd[:branch] = cmd_split[3]

  end
end


alive = Robot.new
alive.connect_and_listen
#pass = Listen.new
#pass.print_var(cmd)
