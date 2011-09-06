load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks


namespace :db do
  task :seed, :only => { :primary => true } do
    run "sh -c 'cd #{latest_release} && bundle exec rake db:seed RAILS_ENV=#{rails_env}'"
  end
end

after 'deploy:update_code' do
  run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
end
