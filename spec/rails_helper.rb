# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_bot_rails'
require 'capybara/rspec'

require 'devise'
require_relative 'support/controller_macros'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  # config.infer_spec_type_from_file_location!
  # config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  config.include Devise::Test::ControllerHelpers, type: :controller

  config.include Devise::Test::IntegrationHelpers, type: :feature

  config.extend ControllerMacros, :type => :controller
  
  config.before(:suite) do
    if config.use_transactional_fixtures?
      raise(<<-MSG)
        Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
        (or set it to false) to prevent uncommitted transactions being used in
        JavaScript-dependent specs.
        During testing, the app-under-test that the browser driver connects to
        uses a different database connection to the database connection used by
        the spec. The app's database connection would not be able to access
        uncommitted transaction data setup over the spec's database connection.
      MSG
    end
    DatabaseCleaner.clean_with(:truncation)
  end

  # config.after(:each) do
  #   DatabaseRewinder.clean
  # end


config.before(:each) do
  DatabaseCleaner.strategy = :transaction
end

config.before(:each, type: :feature) do
  # :rack_test driver's Rack app under test shares database connection
  # with the specs, so continue to use transaction strategy for speed.
  driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
  
  unless driver_shares_db_connection_with_specs
    # Driver is probably for an external browser with an app
    # under test that does *not* share a database connection with the
    # specs, so use truncation strategy.
    DatabaseCleaner.strategy = :truncation
  end
end

config.before(:each) do
  DatabaseCleaner.start
end

config.append_after(:each) do
  DatabaseCleaner.clean
end

config.infer_spec_type_from_file_location!
config.filter_rails_from_backtrace!
end


Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Capybara.register_driver :chrome do |app|

  Capybara::Selenium::Driver.new(app, :browser => :chrome)

end

Capybara.javascript_driver = :chrome

