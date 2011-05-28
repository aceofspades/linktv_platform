# http://stackoverflow.com/questions/4526122/migrations-in-rails-engine
# http://stackoverflow.com/questions/4768301/converting-rails-2-generators-to-rails-3

class LinktvPlatformInstallGenerator < Rails::Generator::Base

  def initialize(runtime_args, runtime_options = {})
    raise "LinktvPlatformInstallGenerator not yet functional"
    #runtime_args[:source_root] = File.expand_path('../templates/db/migrate', __FILE__)
    super
  end

  def manifest
    record do |m|
      m.migration_template '0302_linktv_platform_create_content_sources.rb', 'db/migrate'
    end
  end
end
