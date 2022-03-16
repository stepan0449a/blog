# frozen_string_literal: true

class SystemTestsScreenshotSaver
  include Singleton

  class << self
    extend Forwardable
    def_delegators :instance,
                   :save_page,
                   :save_screenshot,
                   :ensure_prune_last_run,
                   :prune

    def clear_instance
      class_eval { @singleton__instance__ = nil }
    end
  end

  def screenshots_folder
    Rails.root.join('tmp/screenshots')
  end

  def save_page(name, folder = screenshots_folder)
    name = "#{name}.html" unless name.end_with?('.html')
    full_path = File.join(folder, name)
    Capybara.page.save_page(full_path)
    puts "[HTML]: #{full_path}" # rubocop:disable Rails/Output
  end

  def save_screenshot(name, folder = screenshots_folder)
    name = "#{name}.png" unless name.end_with?('.png')
    full_path = File.join(folder, name)
    Capybara.page.save_screenshot(full_path)
    puts "[Screenshot]: #{full_path}" # rubocop:disable Rails/Output
  end

  def prune(folder)
    wildcard_path = File.expand_path('*.{html,png}', folder)
    files = Dir.glob(wildcard_path)
    FileUtils.rm_rf(files) if files.any?
  end

  # remove screenshots from old run for provided folder
  def ensure_prune_last_run(folder = screenshots_folder)
    @last_run_pruned ||= {}
    return if @last_run_pruned[folder]

    prune(folder)
    @last_run_pruned[folder] = true
  end
end
