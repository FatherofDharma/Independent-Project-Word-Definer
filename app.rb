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

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.sort()
  erb(:words)
end

# This section is for paths relating to definitions specifically.

post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end

get ('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

patch ('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.edit(params[:redefine], @word.id)
  erb(:word)
end

delete ('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
