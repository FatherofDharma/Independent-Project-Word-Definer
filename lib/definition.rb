require('pry')

class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@total_ids = 0

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@total_ids += 1
  end

  def == (definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def edit(name, word_id)
    self.name = name
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_word(word_id)
    definitions_arr = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions_arr.push(definition)
      end
    end
    definitions_arr
  end

  def word
    Word.find(self.word_id)
  end

end
