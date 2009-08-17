require 'rubygems'
require 'sinatra'
require 'shortcuts'


get '/' do
  haml :shortcuts
end

get '/*' do
  @key  = request.host =~ /^(.*?)(?:\.|$)/ && $1
  url   = Shortcuts[@key] or return haml :fail
  query = Rack::Utils.escape(params[:splat].to_s)
  redirect url + query
end


__END__

@@ layout
%html
  %head
    %title Get Lucky!
  %body
    = yield

@@ fail
%h1   No search defined for '#{@key}'
=     haml :shortcuts

@@ shortcuts
%h3   Existing shortcuts:
%pre= Shortcuts.yml_string
