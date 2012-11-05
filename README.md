gmail_notifier
==============


Usage
======
    $ ruby controller start


![Imgur](http://i.imgur.com/Bgf1L.png?1)


    Usage: gmail_notifier.rb <command> <options> -- <application options>

    * where <command> is one of:

       start         start an instance of the application
       stop          stop all instances of the application
       restart       stop all instances and restart them afterwards
       reload        send a SIGHUP to all instances of the application
       run           start the application and stay on top
       zap           set the application to a stopped state
       status        show status (PID) of application instances

    * and where <options> may contain several of the following:

      -t, --ontop                      Stay on top (does not daemonize)
      -f, --force                      Force operation
      -n, --no_wait                    Do not wait for processes to stop

    Common options:
      -h, --help                       Show this message
      --version                    Show version
