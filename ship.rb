
class Ship

  attr_accessor :name
  attr_accessor :length

  def initialize(name: '', length: 2)
    self.name = name
    self.length = length
  end

end
