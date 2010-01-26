module ApeOnRails
  module Routing
    module MapperExtensions
      def apeonrails
        @set.add_route("/apeonrails/config.js", {:controller => "ape_on_rails", :action => "configjs"})
      end
    end
  end
end

ActionController::Routing::RouteSet::Mapper.send :include, ApeOnRails::Routing::MapperExtensions

