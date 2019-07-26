require('rspec')
require('word')

describe '#Word' do

  describe('#Word') do
    it('creates a new word object with an entered name and a unique id') do
      word = Word.new('bubblefy', nil)
      expect(word.name).to(eq('bubblefy'))
    end
  end

end
