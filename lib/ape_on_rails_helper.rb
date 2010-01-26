module ApeOnRailsHelper
  def ape_javascript_include_tag
    javascript_include_tag "/apeonrails/config.js"
  end

  def config_ape
    return ape_config = YAML.parse_file("#{RAILS_ROOT}/config/ape_config.yml")[RAILS_ENV]
  end
end

