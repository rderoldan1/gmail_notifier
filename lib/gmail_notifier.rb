require 'gmail'
require 'yaml'
require File.dirname(__FILE__)+'/notifier/configure'

class Gmail_notifier

  include Configure
  #notifier = Configure.new
  def initialize()
    file = YAML.load_file(CONFIG_FILE)
    @user, @password, @minutes = file['user'], file['pass'], file['minutes']
  end

  def run
    @last_state = 0
    @last_title = ""
    @title = ""
    loop do
      Gmail.new(@user, @password) do |gmail|
        count_unread = gmail.inbox.count(:unread)
        @last_state = count_unread
        messages = ""
        gmail.inbox.emails(:unread).each do |email|
          email.from.each do |send|
            messages += "[#{send.name}: "
          end
          messages += " #{email.subject}]\n"
          @title = email.subject
        end

        notify("#{count_unread} Correo(s) sin leer",messages) unless @title.eql? @last_title or count_unread == 0
        @last_title = @title
        gmail.logout
      end
      sleep(@minutes*60)
    end

  end

  def notify(title, message)
    icon = File.dirname(__FILE__) + "/../assets/gMail-icon.jpg"
    #puts icon
    system("notify-send '#{title}' '#{message}' -i #{icon}")
  end

end

notifier = Gmail_notifier.new()
notifier.run
