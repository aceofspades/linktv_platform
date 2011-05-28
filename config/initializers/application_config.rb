# Apply linktv_platform.yml, and then override with any environment-specific settings in application.yml
APP_CONFIG = HashWithIndifferentAccess.new YAML::load_file File.join LINKTV_PLATFORM_ROOT,
  "config", "linktv_platform.yml"

