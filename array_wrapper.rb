require_relative 'simple_enumerable'

class ArrayWrapper
  include SimpleEnumerable

  def initialize(*items)
    @items = items.flatten
  end

  def each(&block)
    @items.each(&block)
    self
  end
end

foo = ArrayWrapper.new([5,6,7,8,9,10])
puts foo.inject {|memo, i| memo * i}
