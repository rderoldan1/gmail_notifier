module Configure
  CONFIG_DIR = "#{ENV['HOME']}/.config/gmail_notifier"
  CONFIG_FILE = "#{CONFIG_DIR}/config.yml"
  AUTOSTART_DIR = "#{ENV['HOME']}/.config/autostart"
  def set_config

  end

  def autostart

      if File.exist?("#{AUTOSTART_DIR}/gmail_notifier.desktopsd")
        "Autostart configured"
      else
        autostart = File.new("#{AUTOSTART_DIR}/gmail_notifier.desktopaa","w")
        autostart_a = "[Desktop Entry]\nType=Application\nTerminal=false\nName=Gmail Notificator\n
Comment=Fetch periodically your Gmail Inbox\nExec=/etc/init.d/gmail_notifier start"
        autostart.write(autostart_a)

        autostart.close

      end
  end


end