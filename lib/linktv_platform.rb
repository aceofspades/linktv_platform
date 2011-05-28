# Linktv::Platform
# This is analagous to the application's init.rb file

puts "xxx in linktv_platform.rb"

require 'rails'
require 'active_support/dependencies'
require File.expand_path('../../config/paths.rb', __FILE__)

module LinktvPlatform

  autoload :Exceptions, 'linktv_platform/exceptions'

  module Models
    autload :Models, 'linktv_platform/app/models'
  end

  module Controllers
    autoload :Controllers, 'linktv_platform/app/controllers'
    autoload :Helpers, 'linktv_platform/app/helpers'
  end

end

#module Linktv
#  module Platform
#    Rails::Initializer.run do |config|
#      puts "xxx in linktv_platform.rb initialize.run"
#      require 'linktv/platform/authorization'
#
#      config.middleware.use "Thumbnailer"
#
#      config.after_initialize do
#        puts "xxx in linktv_platform.rb after_initialize"
#
#        # load initializers
#        Dir["#{LINKTV_PLATFORM_ROOT}/config/initializers/**/*.rb"].sort.each do |initializer|
#          load(initializer)
#        end
#
#        require 'linktv/platform/platform_controller'
#        require 'extensions/active_record'
#
#        # handle Solr server connect errors (silently)
#        require 'sunspot_rails'
#        Sunspot.session = Sunspot::SessionProxy::SilentFailSessionProxy.new(Sunspot.session)
#
#        require 'extensions/delayed_job'
#
#        # Include hook code here
#        # This is executed after environment.rb is complete, and before config/initializers/*
#
#        begin
#          # Use double quotes for attributes
#          require 'haml'
#          require 'haml/template'
#          Haml::Template.options[:attr_wrapper] = '"'
#        rescue LoadError
#          # Fail silently to allow rake gems:install to function
#        end
#
#        if defined? Sass
#          # Add plugin SASS directory to path
#          stylesheets_path = File.join LINKTV_PLATFORM_ASSETS_ROOT, 'stylesheets'
#          Sass::Plugin.add_template_location \
#            File.join(stylesheets_path, 'sass'), stylesheets_path
#          Sass::Plugin.options[:style] = :compressed unless DEVELOPMENT_MODE
#        end
#
#        begin
#          require 'encryptor'
#          key = ::APP_CONFIG[:simple_encryption][:secret_key]
#          Encryptor.default_options.merge!(:key => key)
#        rescue LoadError
#          # Fail silently to allow rake gems:install to function
#        end
#
#      end
#    end
#
#  end
#end

