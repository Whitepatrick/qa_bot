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

require 'xmpp4r'

# def test_method(var_string)
#  puts var_string
#end

# Basic console client that does nothing, but easy to modify to test things.
# to test, start, then type :
# connect login@server/resource password
# auth
$:.unshift '../../../../../lib'
require 'xmpp4r/client'
require 'xmpp4r/sasl'
include Jabber
Jabber::debug = true
class BasicClient
  def initialize
    puts "Welcome to this Basic Console Jabber Client!"
    quit = false
# main loop
    while not quit do
      print "> "
      $>.flush
      line = gets
      quit = true if line.nil?
      if not quit
        command, args = line.split(' ', 2)
        args = args.to_s.chomp
# main case
        case command
          when 'exit'
            quit = true
          when 'connect'
            do_connect(args)
          when 'help'
            do_help
          when 'auth'
            do_auth
          else
            puts "Command \"#{command}\" unknown"
        end
      end
    end
    puts "Goodbye!"
  end
  def do_help
    puts <<-EOF
# exit - exits
# connect user@server/resource password - connects
# auth - sends authentification
    EOF
  end
##
# connect <jid> <password>
  def do_connect(args)
    @jid, @password = args.split(' ', 2)
    @jid = JID.new(@jid)
    @cl = Client.new(@jid)
    @cl.connect
  end
##
# auth
  def do_auth
    @cl.auth(@password)
  end
end
BasicClient.new