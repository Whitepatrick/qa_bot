#!/usr/bin/env ruby
# qa_bot.rb
# By: Patrick White

require 'jabber_bot'

bot = JabberBot.new({'host' => 'chat.smartbrief.com',
                    'JID' => 'qa@chat.smartbrief.com',
                    'resource' => 'bot',
                    'password' => 'temp123!',
                    'operators' => ['pwhite@chat.smartbrief.com']})

bot.add_command('hey?', 'hey?', 'responds if bot hears you') do |params|
  params['jabber'].say(params['message'].from, 'hello there!')
end

bot.connect()
bot.listen()
while true
  sleep(120)
end
bot.disconnect()