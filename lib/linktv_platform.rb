# Linktv::Platform
# This is analagous to the application's init.rb file

module Linktv
  module Platform
    require File.expand_path('../../config/paths.rb', __FILE__)
    require 'linktv/platform/authorization'

    # Should be called from app's environment.rb:
    #
    # require "#{RAILS_ROOT}/vendor/plugins/linktv_platform/config/environment.rb"
    #
    # Rails::Initializer.run do |config|
    #   ...
    #   Linktv::Platform::initializer config
    #   ...
    # end

    def self.initializer config
      config.middleware.use "Thumbnailer"

      config.after_initialize do

        # load initializers
        Dir["#{LINKTV_PLATFORM_ROOT}/config/initializers/**/*.rb"].sort.each do |initializer|
          load(initializer)
        end

        require 'extensions/active_record'

        # handle Solr server connect errors (silently)
        require 'sunspot_rails'
        Sunspot.session = Sunspot::SessionProxy::SilentFailSessionProxy.new(Sunspot.session)

        require 'extensions/delayed_job'

        # Include hook code here
        # This is executed after environment.rb is complete, and before config/initializers/*

        require 'deep_merge'
        config_overrides = HashWithIndifferentAccess.new YAML::load_file(File.join(
          RAILS_ROOT, "config", "application.yml")) rescue nil
        if config_overrides.present?
          ::APP_CONFIG.deep_merge! config_overrides[:all] unless config_overrides[:all].nil?
          ::APP_CONFIG.deep_merge! config_overrides[RAILS_ENV] unless config_overrides[RAILS_ENV].nil?
        end

        begin
          # Use double quotes for attributes
          require 'haml'
          require 'haml/template'
          Haml::Template.options[:attr_wrapper] = '"'
        rescue LoadError
          # Fail silently to allow rake gems:install to function
        end

        if defined? Sass
          # Add plugin SASS directory to path
          stylesheets_path = File.join LINKTV_PLATFORM_ASSETS_ROOT, 'stylesheets'
          Sass::Plugin.add_template_location \
            File.join(stylesheets_path, 'sass'), stylesheets_path
          Sass::Plugin.options[:style] = :compressed unless DEVELOPMENT_MODE
        end

        begin
          require 'encryptor'
          key = ::APP_CONFIG[:simple_encryption][:secret_key]
          Encryptor.default_options.merge!(:key => key)
        rescue LoadError
          # Fail silently to allow rake gems:install to function
        end

        # Register mime_types
        ::Mime::Type.register "application/rdf+xml", :rdf

        #require 'generators/linktv_platform/linktv_platform_generator'
      end
    end
    
  end
end

