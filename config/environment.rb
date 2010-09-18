require 'rubygems'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

# determine application's root directory
ROOT_DIR = File.expand_path(File.join( File.dirname(__FILE__), '..'))

# add libdirs to load path
['config', 'app/models', 'lib'].each do |relative_path|
  $LOAD_PATH.unshift(File.join(ROOT_DIR, relative_path))
end

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/'
               )

  ENVIRONMENT = Sinatra::Base.environment

  # Load all defined models
  Dir.glob("#{ROOT_DIR}/app/models/*.rb") do |lib| 
    require File.basename(lib, '.*') 
  end
               
  DataMapper.setup(
    :default, 
    (ENV["DATABASE_URL"] || "sqlite3:///#{ROOT_DIR}/db/#{ENVIRONMENT}.sqlite3")
  )

end
