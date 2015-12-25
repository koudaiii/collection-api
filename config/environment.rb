# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  Rails.logger = Le.new(ENV["LOGENTRIES_TOKEN"], tag: true)
end
