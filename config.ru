require 'rubygems'
require 'sinatra'

# first require sinatra, modify settings
# and then load application. Since otherwise all
# configure blocks are run and we are loosing our
# settings. Wrong database is accessed and so on ...
set :run, false
set :environment, :production

require 'application'

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
