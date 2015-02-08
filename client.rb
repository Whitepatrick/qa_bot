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

require 'rspec'
require 'xmpp4r'
require 'xmpp4r/robot'
require_relative 'vars'
require_relative 'listen'

class Client

  # Method to connect bot to server and begin
  # listening for messages. Later functionality
  # will include joing MUC.
  def connect_and_listen
    # calls xmpp4r-robot instance w/ connection
    robot = Jabber::Robot.new(USERNAME, PASSWORD,
                             :auto_accept_subscription => true,)
    # starts bot
    robot.start#.roster

    rd, wr = IO.pipe
    Signal.trap('INT'){ wr.puts }
    rd.gets

    robot.notify_message do | from, body |
      # transform(from, body)
      puts "#{from}" ' says:: ' "#{body}"
    end


    # takes incoming messages, stores them lowercase
    # and sends to transform method for further
    # assignments

    # Opens a stream to listen to
    # quits when interrupt is received

    # stops bot
    robot.stop
    exit
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

    # user = from.downcase!
    # msg = body.downcase!

    message = Hash.new{|h,k| h[k] = 0 }
    message[:from] = from
    message[:cmd] = body

    cmd = Hash.new{|h,k| h[k] = 0 }
    cmd_split = body.split(' ')
    cmd[:verb] = cmd_split[0]
    cmd[:target] = cmd_split[1]
    cmd[:repo] = cmd_split[2]
    cmd[:branch] = cmd_split[3]

    puts "#{from}" ' says: ' "#{cmd}"
  end
end

robot = Client.new
robot.connect_and_listen
