require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Spiranthes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # title
    config.title = "ちょこっと攻略"
    config.search_title = "ラスピリちょこっと攻略解説 | ラストピリオド"

    # アプリが日本語だよっていう設定
    # :ja のファイルを作らないと使えないよ
    #config.i18n.default_locale = :ja

    # タイムゾーンの設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
