require_relative '../bot'
require_relative '../client'
require_relative '../listen'

require 'yaml'

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation # :progress. :html, :textmate
end