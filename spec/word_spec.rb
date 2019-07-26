require('rspec')
require('word')

describe '#Word' do

  describe('#Word') do
    it('creates a new word object with an entered name and a unique id') do
      word = Word.new('bubblefy', nil)
      expect(word.name).to(eq('bubblefy'))
    end
  end

  describe('.all') do
    it('returns and empty array where future words will be stored') do
      expect(Word.all).to(eq([]))
    end
  end

  # describe('#save') do
  #   it('store a word object in a hash, mocking a database') do
  #     word = Word.new('bubblefy', nil)
  #     word.save()
  #     expect(Word.name).to(eq('bubblefy'))
  #   end
  # end

  # describe('#==') do
  #   it('will identify as the same word if it has matching attributes') do
  #     word = Word.new('bubblefy', nil)
  #     word2 = Word.new('bubblefy', nil)
  #     expect().to(eq())
  #   end
  # end

end
