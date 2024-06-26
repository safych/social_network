require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module SocialNetwork
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.i18n.default_locale = :uk
    config.i18n.available_locales = [:en, :uk]
  end
end
