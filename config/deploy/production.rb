unless ENV['TEAM']
  $stderr.puts "ERROR: You should specify your team number in TEAM environment variable."
  abort
end

set :team, ENV['TEAM'].to_i
set :stage, :production
set :rails_env, :production

server "app-%03d.speee-sbc" % fetch(:team), user: 'apprunner', roles: %w(app db web)
