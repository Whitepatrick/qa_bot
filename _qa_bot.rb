#!/usr/bin/env ruby
# prototype 0.0.1

require 'xmpp4r'
include 'Jabber'

class JabberBot
  def initialize(config)
    @config = config
    @keep_alive_status = false
    @commands = {}
    @jabber = Client.new(JID::new(@config['JID'] + '/' + @config['resource']))

    # DEFAULT COMMANDS
    keep_alive
  end

  def connect
    begin
      if not @jabber.is_connected?
    end
  end
end