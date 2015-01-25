#!/usr/bin/env ruby
# alert.rb
# Module to inform user(s) or user entity(s)
# of expected or unexpected events
# By: Patrick White


=begin
  This module will serve as a signal processor that
  alerts a user, users, or user entity of an event or
  status. These can be expected alerts (rundeck finish),
  or un-expected (rundeck fail using error handling).

  Should work on integration with system calls & procs
  to give live data on servers if errors happens
    - Tie in to ELK / statsd / Graphite
=end

