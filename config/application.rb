require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module ObjectCannon
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
