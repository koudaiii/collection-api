# https://devcenter.heroku.com/articles/rails-unicorn

if ENV['HEROKU']
  worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
else
  listen "8080", { tcp_nodelay: true, backlog: 100 }

  # Where to drop a pidfile
  pid "/opt/app/tmp/pids/unicorn.pid"

  worker_processes (ENV['RACK_ENV'] == 'production' ? 10 : 4)
end

timeout 30
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect!

  unless ENV['HEROKU']
    old_pid = "/opt/app" + "/tmp/pids/unicorn.pid.oldbin"
    if ::File.exists?(old_pid) && server.pid != old_pid
      begin
        Process.kill("QUIT", ::File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
        # someone else did our job for us
      end
    end
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  ActiveRecord::Base.establish_connection
end
