require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Sample
  class Application < Rails::Application
    config.load_defaults 7.0
    config.middleware.use Rack::MethodOverride
    config.active_record.verify_foreign_keys_for_fixtures = false
  end
end
