unless ENV['TEAM']
  $stderr.puts "ERROR: You should specify your team number in TEAM environment variable."
  abort
end

set :team, ENV['TEAM'].to_i
set :stage, :production
set :rails_env, :production

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, "config/unicorn.rb"
set :unicorn_rack_env, "deployment"

server "app-%03d.speee-sbc" % fetch(:team), user: 'apprunner', roles: %w(app db web)
