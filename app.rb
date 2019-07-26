require('sinatra')
require('sinatra/reloader')
require('./lib/word')
# require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')
also_reload('app.rb')

get ('/') do
  @@words = Word.sort
  erb(:words)
end

get ('/words') do
  @@words = Word.sort
  erb(:words)
end

get ('/words/new') do
  erb(:add_word)
end
