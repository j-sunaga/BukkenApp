require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevExam
  class Application < Rails::Application

    #timezoneを日本時間に設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # css,html,javascripを自動生成しない設定
    config.generators do |g|
    g.assets false
    g.helper false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
