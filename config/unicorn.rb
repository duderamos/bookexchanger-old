 worker_processes 3
 app_root = File.expand_path('../../', __FILE__)
 pid "#{app_root}/tmp/pids/unicorn.pid"
 listen "#{app_root}/tmp/sockets/unicorn.sock"
 stdout_path "#{app_root}/log/unicorn.log"
 stderr_path "#{app_root}/log/unicorn.log"
