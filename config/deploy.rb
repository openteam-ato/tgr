require 'openteam/capistrano/recipes'
require 'whenever/capistrano'

namespace :files do
  desc 'Synchronize your local files in public/system using remote files'
  task :pull do
    transfer :down, "#{shared_path}/system", 'public', :via =>:scp, :recursive =>:true
  end
end

set :shared_children, fetch(:shared_children) + %w[public/system]

set :default_stage, :ato
