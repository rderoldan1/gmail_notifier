require 'daemons'

class Controller
  Daemons.run("#{File.dirname(__FILE__)}/gmail_notifier.rb")
end