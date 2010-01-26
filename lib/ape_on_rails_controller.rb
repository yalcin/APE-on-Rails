class ApeOnRailsController < ActionController::Base
  include ApeOnRailsHelper
  def configjs
    conf ||= config_ape
    js_content =<<-END
APE.Config.baseUrl = '#{conf["baseUrl"].value}';
APE.Config.domain = '#{conf["domain"].value}';
APE.Config.server = '#{conf["server"].value}';
(function(){
  for (var i = 0; i < arguments.length; i++)
    APE.Config.scripts.push(APE.Config.baseUrl + '/Source/' + arguments[i] + '.js');
})('mootools-core', 'Core/APE', 'Core/Events', 'Core/Core', 'Pipe/Pipe', 'Pipe/PipeProxy', 'Pipe/PipeMulti', 'Pipe/PipeSingle', 'Request/Request','Request/Request.Stack', 'Request/Request.CycledStack', 'Transport/Transport.longPolling','Transport/Transport.SSE', 'Transport/Transport.XHRStreaming', 'Transport/Transport.JSONP', 'Core/Utility', 'Core/JSON');
    END

    render :js => js_content
  end
end

