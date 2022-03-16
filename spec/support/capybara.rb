# frozen_string_literal: true

require 'capybara'
require 'capybara/active_admin/rspec'
require 'capybara/rspec'
require 'capybara/cuprite'
require 'capybara-screenshot/rspec'

module CupriteConfig
  module_function

  def build_driver(app, override_config = {})
    config = driver_config.deep_merge(override_config)
    Capybara::Cuprite::Driver.new(app, config)
  end

  def driver_config
    {
      js_errors: true,
      window_size: [1440, 1080],
      process_timeout: 10, # fix for macOS chrome
      timeout: 10, # to fix some rare cases on local machine
      url_blacklist: url_blacklist,
      url_whitelist: url_whitelist,
      # https://peter.sh/experiments/chromium-command-line-switches/
      browser_options: {
        'disable-gpu' => nil,
        'no-sandbox' => nil,
        'disable-setuid-sandbox' => nil,
        'start-maximized' => nil,
        '--ignore-certificate-errors' => nil
      }
    }
  end

  def url_whitelist
    [
      'http://127.0.0.1:*',
      'http://localhost:*',
      'http://lvh.me:*'
    ]
  end

  def url_blacklist
    [
      # avoid system tests from hanging when google-chrome fetching something in background.
      'http://update.googleapis.com',
      'https://update.googleapis.com',
      # to get something from https uri in tests
      # we need to generate certs for puffing billy
      # and upload them to google-chrome, which is pretty complicated.
      # So we decided to blacklist such URLs manually,
      # so those requests will be rejected on browser side before passing them
      # to proxy.
      'https://www.google.com',
      'https://google.com',
      'https://www.gravatar.com',
      'http://maps.googleapis.com',
      'https://maps.google.com'
    ]
  end
end

Capybara.register_driver :cuprite_headless do |app|
  CupriteConfig.build_driver(app)
end

Capybara.register_driver :cuprite do |app|
  CupriteConfig.build_driver(app, headless: false)
end

Capybara.javascript_driver = ENV['JS_DRIVER'].presence&.to_sym || :cuprite_headless

if ENV['TEST_ENV_NUMBER']
  Capybara.server_port = 9887 + ENV['TEST_ENV_NUMBER'].to_i
end

Capybara.server_host = '127.0.0.1'
# By default capybara fails rspec example if exception was raised in application code during request.
# But for exceptions which was raised in gem capybara just shows exception in log and respond 500 on request.
# We need application code exceptions to be handled like gem's errors because we can catch gem error, do something
# and reraise it again.
Capybara.raise_server_errors = false

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by Capybara.javascript_driver
  end

  config.before(:each, type: :system, js: true, js_driver: :cuprite) do
    driven_by :cuprite
  end
end
