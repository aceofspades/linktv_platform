require 'deep_merge'

# Apply linktv_platform.yml, and then override with any environment-specific settings in application.yml
APP_CONFIG = HashWithIndifferentAccess.new YAML::load_file File.join LINKTV_PLATFORM_ROOT,
  "config", "linktv_platform.yml"

config_overrides = HashWithIndifferentAccess.new YAML::load_file(File.join(
  RAILS_ROOT, "config", "application.yml")) rescue nil
if config_overrides.present?
  ::APP_CONFIG.deep_merge! config_overrides[:all] unless config_overrides[:all].nil?
  ::APP_CONFIG.deep_merge! config_overrides[RAILS_ENV] unless config_overrides[RAILS_ENV].nil?
end
