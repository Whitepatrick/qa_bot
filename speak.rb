#!/usr/bin/env ruby
# speak.rb
# Module to return processed data to the user
# or requesting entity
# By: Patrick White


=begin
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
=end

require 'xmpp4r'
require_relative 'connect'