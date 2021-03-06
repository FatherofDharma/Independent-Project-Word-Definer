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

  def edit(name)
    self.name = name
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def self.sort
    sorted_words = @@words.sort_by { |id, word| word.name.downcase }
    @@words = sorted_words.to_h
    @@words.values
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end
