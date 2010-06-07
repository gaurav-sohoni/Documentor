module SettingConfig
  $setting = YAML::load(File.open("#{RAILS_ROOT}/config/block_settings.yml"))
end

