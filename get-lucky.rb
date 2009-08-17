require 'rubygems'
require 'sinatra'
require 'shortcuts'

get '/*' do
  @key  = request.host =~ /^(.*?)(?:\.|$)/ && $1
  url   = Shortcuts[@key] or return haml :fail
  query = Rack::Utils.escape(params[:splat].to_s)
  redirect url + query
end

__END__

@@ fail
%html
  %h1   No search defined for '#{@key}'
  %h3   Existing searches:
  %pre= Shortcuts.yml_string
