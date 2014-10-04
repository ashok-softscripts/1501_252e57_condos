set :application, '1501_252e57_condos_full'
set :repo_url, 'ssh://git@sg1.softgravity.com/1501_252e57_condos.git'
set :deployment_server, :passenger

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, "master_full"
set :deploy_to, "/var/www/#{fetch(:application)}"
set :scm, :git

# set :format, :pretty
set :log_level, :info
# set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log public/system}

set :rvm_ruby_version, 'ruby-2.1.2'
set :rvm_type, :system

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5
