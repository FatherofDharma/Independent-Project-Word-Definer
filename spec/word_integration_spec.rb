require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word to the dictionary!')
    fill_in('new_word', :with => 'oscarfy')
    click_on('Make a new word!')
    expect(page).to have_content('oscarfy')
  end
end

describe('deletes a word', {:type => :feature}) do
  it('deletes a word') do
    word = Word.new('lickify', nil)
    word.save()
    word2 = Word.new('spellify', nil)
    word2.save()
    visit("/words/#{word.id}/edit")
    click_on('Delete Word!')
    expect(page).to have_no_content('lickify')
  end
end

describe('edits a word', {:type => :feature}) do
  it('edits a word') do
    word = Word.new('lickify', nil)
    word.save()
    word2 = Word.new('spellify', nil)
    word2.save()
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => "salivafy")
    click_on('Change the Word')
    expect(page).to have_content('salivafy')
    expect(page).to have_no_content('lickify')
  end
end

describe('create an definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new('lickify', nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'to cover something in tongue juice')
    click_on('Add the Definition')
    expect(page).to have_content('to cover something in tongue juice')
  end
end

describe('edit a definition', {:type => :feature}) do
  it('edits a definition') do
    word = Word.new('lickify', nil)
    word.save()
    definition = Definition.new('to cover something in tongue juice', word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in('redefine', :with => 'to lick something until your tongue falls off')
    click_on('Change the Definition')
    expect(page).to have_content('to lick something until your tongue falls off')
  end
end

describe('delete a definition', {:type => :feature}) do
  it('deletes a definition') do
    word = Word.new('lickify', nil)
    word.save()
    definition = Definition.new('to cover something in tongue juice', word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on('Delete Definition!')
    expect(page).to have_no_content('to cover something in tongue juice')
  end
end
