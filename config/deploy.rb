# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "bootcampsns"
set :repo_url, "git@github.com:speee/bootcampsns.git"
set :branch, ENV['branch'] || 'master'
set :deploy_to, "/home/apprunner/bootcampsns"
set :pty, true

# append :linked_files, "config/database.yml", "config/secrets.yml"
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
