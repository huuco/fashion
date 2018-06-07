require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module FashionShop
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = ENV["TIME_ZONE"]
  end
end
