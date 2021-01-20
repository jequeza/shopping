class Vendor
  attr_reader :name,
              :stock

  def initialize(name)
    @name = name
    @stock = Hash.new(0)
  end
end