#!/usr/bin/env ruby
# exec.rb
# Module to preform executions of commands
# based on input recieved from listen.rb
# By: Patrick White

=begin
  This module will serve as an executioner of
  commands received from the listen module or
  alert module

  Should return stdout & stderr to speak module
    - Receive parameters for execution
    - Construct command based on params
    - Set destination based on params
    - Execute
    - Return status or exit
=end

require 'xmpp4r'
require_relative 'client'