module ApeOnRailsHelper
  def ape_javascript_include_tag
    javascript_include_tag "/apeonrails/config.js"
  end

  def config_ape
    return ape_config = YAML.parse_file("#{RAILS_ROOT}/config/ape_config.yml")[RAILS_ENV]
  end

  def send_to_ape(p = {})
    conf ||= config_ape
    ape_string = {}
    ape_params = {}


    ape_params[:channel] = p[:channel]
    ape_params[:raw] = p[:raw]
    ape_params[:data] = p[:data]
    ape_string[:cmd] = p[:cmd]
    ape_string[:params] = ape_params

    if p.has_key?(:params)
      ape_string[:params].merge!(p[:params])
    end

    escaped_string = CGI::escape([ape_string].to_json)
    Thread.new do
      resp = Net::HTTP.get_response(URI::parse("http://" + conf["server"].value + "/?" + escaped_string))
    end
  end
end

