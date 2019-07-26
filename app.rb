require('sinatra')
require('sinatra/reloader')
require('./lib/word')
# require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')
also_reload('app.rb')

get ('/') do
  @words = Word.sort
  erb(:words)
end

get ('/words') do
  @words = Word.sort
  erb(:words)
end

get ('/words/new') do
  erb(:add_word)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post ('/words') do
  name = params[:new_word]
  word = Word.new(name, nil)
  word.save()

  @words = Word.sort()
  erb(:words)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.edit(params[:name])
  @words = Word.sort()
  erb(:words)
end
