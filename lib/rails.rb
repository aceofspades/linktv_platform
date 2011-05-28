puts "xxx in engine rails.rb"

module LinktvPlatform
  class Engine < ::Rails::Engine
    config.linktv_platform = LinktvPlatform

    # Force routes to be loaded if we are doing any eager load.
    config.before_eager_load { |app| app.reload_routes! }

    initializer "linktv_platform.url_helpers" do
      LinktvPlatform.include_helpers(Linktv::Controllers)
    end

  end
end
