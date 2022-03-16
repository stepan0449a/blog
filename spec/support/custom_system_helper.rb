# frozen_string_literal: true

module CustomSystemHelper
  extend ActiveSupport::Concern

  included do
    RSpec.configure do |config|
      config.after(:suite) do
        # clear SystemTestsPageSaver singleton instance
        SystemTestsScreenshotSaver.clear_instance
      end
    end

    # actionpack-5.2.1/lib/action_dispatch/system_testing/test_helpers/screenshot_helper.rb
    # @see ActionDispatch::SystemTesting::TestHelpers::ScreenshotHelper#take_failed_screenshot
    def take_failed_screenshot
      SystemTestsScreenshotSaver.ensure_prune_last_run
      SystemTestsScreenshotSaver.save_screenshot(image_name) if failed? && supports_screenshot?
      SystemTestsScreenshotSaver.save_page(image_name) if failed?
    end
  end
end
