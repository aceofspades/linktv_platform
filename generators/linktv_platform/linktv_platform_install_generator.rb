class LinktvPlatformInstallGenerator < Rails::Generator::Base

#  def initialize(runtime_args, runtime_options = {})
#    runtime_args[:source_root] = File.expand_path('../templates/db/migrate', __FILE__)
#    super
#  end

  def manifest
    record do |m|
      m.migration_template '0302_linktv_platform_create_content_sources.rb', 'db/migrate'
    end
  end
end

#class LinktvPlatformMigrationGenerator < Rails::Generator::NamedBase
#  attr_reader :exception_table_name
#  def initialize(runtime_args, runtime_options = {})
#    @exception_table_name = (runtime_args.length < 2 ? 'logged_exceptions' : runtime_args[1]).tableize
#    runtime_args << 'add_exception_table' if runtime_args.empty?
#    super
#  end
#
#  def manifest
#    record do |m|
#      m.migration_template 'db/migrate/0302_linktv_platform_create_content_sources.rb', 'db/migrate'
#    end
#  end
#end








#require 'rails_generators/generators/migration'
#require 'rails_generator'
#
#module LinktvPlatform
##  module Generator
#    class InstallGenerator < ::Rails::Generator::Base
##      include Rails::Generators::Migration
#
#      def initialize(runtime_args, runtime_options = {})
#        runtime_args[:source_root] = File.expand_path('../templates', __FILE__)
#        super
#      end
#
#      def self.next_migration_number(path)
#        unless @prev_migration_nr
#          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
#        else
#          @prev_migration_nr += 1
#        end
#        @prev_migration_nr.to_s
#      end
#
#      def manifest
#        record do
#          #m.directory 'db/migrate'
#          m.migration_template "db/migrate/0302_linktv_platform_create_content_sources.rb", 'db/migrate'
#        end
#      end
#
##      def migration_files
##        [
##          "0302_linktv_platform_create_content_sources.rb",
##          "0303_linktv_platform_create_content_type_semantic_apis.rb",
##          "0304_linktv_platform_create_content_types.rb",
##          "0305_linktv_platform_create_countries.rb",
##          "0500_linktv_platform_create_entity_dbs.rb",
##          "0501_linktv_platform_create_entity_identifiers.rb",
##          "0502_linktv_platform_create_external_contents.rb",
##          "0700_linktv_platform_create_geo_ip_caches.rb",
##          "0701_linktv_platform_create_geo_restrictions.rb",
##          "0900_linktv_platform_create_images.rb",
##          "0901_linktv_platform_create_imported_videos.rb",
##          "1200_linktv_platform_create_links.rb",
##          "1600_linktv_platform_create_pages.rb",
##          "1602_linktv_platform_create_playlists.rb",
##          "1603_linktv_platform_create_playlist_items.rb",
##          "1800_linktv_platform_create_region_videos.rb",
##          "1801_linktv_platform_create_regions.rb",
##          "1802_linktv_platform_create_resource_attrs.rb",
##          "1803_linktv_platform_create_roles.rb",
##          "1804_linktv_platform_create_roles_users.rb",
##          "1900_linktv_platform_create_semantic_apis.rb",
##          "2000_linktv_platform_create_topic_video_segments.rb",
##          "2001_linktv_platform_create_topics.rb",
##          "2100_linktv_platform_create_users.rb",
##          "2200_linktv_platform_create_video_files.rb",
##          "2201_linktv_platform_create_video_play_stats.rb",
##          "2202_linktv_platform_create_video_segments.rb",
##          "2204_linktv_platform_create_video_sources.rb",
##          "2205_linktv_platform_create_videos.rb"
##        ]
##      end
#
##      def copy_migrations
##        migration_files.each do |file|
##          migration_template file, "db/migrate/#{file}"
##        end
##      end
#
#    end
##  end
#end
