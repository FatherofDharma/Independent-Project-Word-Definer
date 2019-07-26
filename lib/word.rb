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

end
