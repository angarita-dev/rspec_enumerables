# frozen_string_literal: true

# This custom Enumerable module replicates the work of
# ... the default Enumerable methods

module Enumerable
  def my_each
    for i in (0...length)
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in (0...length)
      yield(self[i], i)
    end
  end

  def my_select
    result = []
    my_each do |current|
      result.push(current) if yield(current)
    end
    return result
  end

  def my_all?
    my_each do |current|
      result = yield(current)
      return false if result.nil? || result == false
    end
    return true
  end

  def my_none?
    my_each do |current|
      result = yield(current)
      return false if result.nil? || result
    end
    return true
  end

  def my_count(proc = nil)
    counter = 0
    if proc.nil?
      my_each do |current|
        result = yield(current)
        counter += 1 if result == true || result == nil
      end
    else
      my_each do |current|
        counter += 1 if proc.call(current)
      end
    end
    return counter
  end

  def my_map(proc = nil)
    result = []
    my_each do |current|
      if proc.nil?
        result << yield(current)
      else
        result << proc.call(current)
      end
    end
    return result
  end

  def my_inject
    counter = self[0]
    my_each do |current|
      result = yield(counter, current)
      counter = result
    end
    return counter
  end

  def multiply_els
    my_inject { |counter, nexti| counter * nexti }
  end
end

