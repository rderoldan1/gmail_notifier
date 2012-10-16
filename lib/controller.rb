require 'daemons'
class Controller

  Daemons.run('gmail_notifier.rb')
end