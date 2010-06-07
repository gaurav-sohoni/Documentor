#this will run migrations and load fixtures
namespace :setup do
  desc "Run Migration scripts and load fixtures"
  task :app => :environment do
    
    desc "Running migrations"
    puts "Migrating .."
    system "rake db:migrate"
    puts "Migration Done!"
    
    desc "Loading initial data"
    puts "Loading Fixtures.."
    system "rake db:fixtures:load"
    puts "Initial data saved!"
  end
end
