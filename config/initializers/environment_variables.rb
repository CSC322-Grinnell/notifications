ENV_CONFIG = YAML.load_file("#{::Rails.root}/config/environment_variables.yml")[::Rails.env]