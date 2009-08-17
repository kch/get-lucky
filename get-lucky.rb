require 'rubygems'
require 'sinatra'
require 'markaby'
require 'shortcuts'

def fail(key)
  Markaby::Builder.new do
    h1   "No search defined for '#{key}'"
    h3   "Existing searches:"
    pre  Shortcuts.yml_string
  end.to_s
end

get '/*' do
  key   = request.host =~ /^(.*?)(?:\.|$)/ && $1
  url   = Shortcuts[key] or return fail(key)
  query = Rack::Utils.escape(params[:splat].to_s)
  redirect url + query
end
