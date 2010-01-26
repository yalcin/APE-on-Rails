puts "Generating ape_config.yml"
config = {"development" =>
                        {"baseUrl" => "http://domain.com/javascripts/ape",
                         "domain" => "domain.com",
                         "server" => "domain.com:6969"},
          "production" =>
                        {"baseUrl" => "http://domain.com/javascripts/ape",
                         "domain" => "domain.com",
                         "server" => "domain.com:6969"},
          "test" =>
                        {"baseUrl" => "http://domain.com/javascripts/ape",
                         "domain" => "domain.com",
                         "server" => "domain.com:6969"}}
File.open("#{RAILS_ROOT}/config/ape_config.yml", "w") {|f| f.write(config.to_yaml)}

