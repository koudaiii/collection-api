# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
if defined?(Unicorn)
  require 'unicorn/worker_killer'
  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, (512*(1024**2)), (640*(1024**2))
end
use Rack::Health, :path => '/healthcheck'
run Rails.application
