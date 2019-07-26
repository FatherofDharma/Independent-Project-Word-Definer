require('pry')

class Word
  attr_reader :id
  attr_accessor :name
  @@words = {}
  @@total_ids = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_ids +=1
  end

  def self.all()
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def == (word_to_be_compared)
    self.name() == word_to_be_compared.name()
  end

  def self.clear
    @@words = {}
    @@total_ids = 0
  end

  def self.find(id)
    @@words[id]
  end

end
