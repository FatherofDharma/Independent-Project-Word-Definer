require('rspec')
require('word')
require('definition')
require('pry')

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('bubblefy', nil)
    @word.save()
  end

  describe('.all') do
    it('returns a list of all definitions') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('eat anything made of bubbles', @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('#save') do
    it('save definitions to the appropriate word') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.clear') do
    it('remove all definitions') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('eat anything made of bubbles', @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a definition by id') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('eat anything made of bubbles', @word.id, nil)
      definition2.save()
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end

  describe('#edit') do
    it('edits a definition by id') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      definition1.edit('makes bubbles out of any liquid', @word.id)
      expect(definition1.name).to(eq('makes bubbles out of any liquid'))
    end
  end

  describe('#delete') do
    it('deletes a definition') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      definition2 = Definition.new('eat anything made of bubbles', @word.id, nil)
      definition2.save()
      definition2.delete()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('#word') do
    it('finds the word a definition b elongs to') do
      definition1 = Definition.new('makes bubbles out of anything', @word.id, nil)
      definition1.save()
      expect(definition1.word).to(eq(@word))
    end
  end

end
