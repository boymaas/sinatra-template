require 'rubygems'
#require 'facets'
require 'sinatra'
require 'sinatra/mapping'

require 'config/environment'

configure do
  set :views, "#{ROOT_DIR}/app/views"
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  haml :root
end
