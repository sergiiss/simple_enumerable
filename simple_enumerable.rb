module SimpleEnumerable
  def map(&block)
    result = []
    each do |elem|
      result << block.call(elem)
    end

    result
  end

  def find(ifnone = nil, &block)
    each do |elem|
      if block.call(elem)
        result = elem
        break
      end
    end

    result ? result : ifnone && ifnone.call
  end

  def reject(&block)
    result = []
    each do |elem|
      result << elem unless block.call(elem)
    end

    result
  end

  def select(&block)
    result = []
    each do |elem|
      result << elem if block.call(elem)
    end

    result
  end

  def inject(accumulator = nil, &block)
    each do |elem|
      unless accumulator == nil
        accumulator = block.call(accumulator, elem)
      end
      accumulator = elem if accumulator == nil
    end

    accumulator
  end
end
