#!/usr/bin/env ruby
# query.rb
# Module to request, parse, and output information
# By: Patrick White


=begin
  This module will serve as a gopher to get information
  requested by the user, or requesting entity (rundeck,
  local proc).

  Query uses
    - Request server stats
    - Request rundeck build stats
    - Request app status (is alc up?)

  Once query has response send to appropriate module
    - Error handle input
    - Export input
=end

require 'xmpp4r'
require_relative 'connect'