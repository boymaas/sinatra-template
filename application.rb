require 'rubygems'
#require 'facets'
require 'sinatra'
require 'sinatra/mapping'

require 'config/environment'

helpers do
  # add your helpers here
end

# root page
get '/' do
  haml :root
end
