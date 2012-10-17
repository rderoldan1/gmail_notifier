require 'gmail'
require 'yaml'

class Gmail_notifier


  CONFIG_DIR = "#{ENV['HOME']}/.config/gmail_notifier"
  CONFIG_FILE = "#{CONFIG_DIR}/config.yml"

  def initialize()
    file = YAML.load_file(CONFIG_FILE)
    @user, @password, @minutes = file['user'], file['pass'], file['minutes']
  end

  def run

    loop do
      Gmail.new(@user, @password) do |gmail|
        count_unread = gmail.inbox.count(:unread)
        messages = ""
        gmail.inbox.emails(:unread).each do |email|
          email.from.each do |send|
            messages += "[#{send.name}: "
          end
          messages += " #{email.subject}]\n"
        end
        notify("#{count_unread} Correo(s) sin leer",messages)
        puts messages
        gmail.logout
      end
      sleep(@minutes*60)#each 5 minutes
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
