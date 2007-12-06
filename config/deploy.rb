require 'mongrel_cluster/recipes'

set :application, "mc"
set :repository,  " https://jsv.mine.nu/svn/repos/mc/trunk/config"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "meetronome.com"
role :web, "meetronome.com"
role :db,  "meetronome.com", :primary => true