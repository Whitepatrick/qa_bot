qa_bot
======================================================
QA Jabber Bot

Very basic chat bot made for work.

In it's current state it's missing a secrets file
I've called vars.rb. This must be present and contain
your login info for this bot to work.

vars.rb should look like this

```
USERNAME = 'username'
PASSWORD = 'password'
```
drop vars.rb right along the main bot classes.

TO-DO
-----

-- Short-term
  -- Add error handling for malformed commands
  -- refactor transform method out of client.rb, move to listen.rb
    -- (or something)
  -- consider file fill of stored procedures
    -- sort of like a menu the user has to pick from?
      -- send: bot list rundeck functions
      -- receive: list of functions possible on rundeck

-- Long-term
  -- Consider adding in MUC support to xmpp4r-robot lib
  -- Ride away smooth