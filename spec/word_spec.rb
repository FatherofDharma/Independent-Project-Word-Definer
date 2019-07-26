require('rspec')
require('word')

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('#Word') do
    it('creates a new word object with an entered name and a unique id') do
      word1 = Word.new('bubblefy', nil)
      expect(word1.name).to(eq('bubblefy'))
    end
  end

  describe('.all') do
    it('returns and empty array where future words will be stored') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('store a word object in a hash, mocking a database') do
      word1 = Word.new('bubblefy', nil)
      word1.save()
      word2 = Word.new('uncyorn', nil)
      word2.save()
      word3 = Word.new('flutterby', nil)
      word3.save()
      expect(Word.all).to(eq([word1, word2, word3]))
    end
  end

  describe('#==') do
    it('will identify as the same word if it has matching attributes') do
      word1 = Word.new('bubblefy', nil)
      word2 = Word.new('bubblefy', nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.find') do
    it('will locate and return a word based on its id') do
      word1 = Word.new('bubblefy', nil)
      word1.save()
      word2 = Word.new('uncyorn', nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

end
